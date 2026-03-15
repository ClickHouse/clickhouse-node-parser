#!/usr/bin/env tsx

/**
 * For each .sql file in clickhouse-tests/, generates:
 *   - <file>.expected.ast.json       — JSON-serialized AST from parse()
 *   - <file>.expected.formatted.sql  — re-formatted SQL from format()
 *   - <file>.expected.explain.txt    — EXPLAIN AST output from a ClickHouse server
 *
 * If the library parser fails, writes "<Parse Error>" to the ast and formatted files.
 * If ClickHouse fails for a statement, writes "<Parse Error>" to the explain file.
 *
 * Requires a ClickHouse server reachable at CLICKHOUSE_URL (default http://localhost:8123).
 * Start one with: docker compose up -d
 */

import { readFileSync, writeFileSync, readdirSync, existsSync } from 'fs';
import { join } from 'path';
import { parse, format, Statement } from '../src/index.js';

const PARSE_ERROR = '<Parse Error>';
const EXPLAIN_ERROR = '<Explain Error>';
const QUERY_PARAMS = '<Query Parameters>';

const dir = new URL('../tests/clickhouse-reference', import.meta.url).pathname;

// ClickHouse HTTP endpoint.
const CLICKHOUSE_URL = 'http://localhost:8123';

// Maximum number of concurrent HTTP requests to the ClickHouse server.
const CONCURRENCY = 20;

// ── Statement splitter (mirrors the logic in filter-select-queries.js) ─────────

function splitStatements(content: string): string[] {
  const statements: string[] = [];
  let current = '';
  let inSingleQuote = false;
  let inDoubleQuote = false;
  let inBacktick = false;
  let dollarTag: string | null = null; // non-null when inside $tag$...$tag$
  let inLineComment = false;
  let inBlockComment = false;

  for (let i = 0; i < content.length; i++) {
    const ch = content[i];
    const next = content[i + 1];

    // Dollar-quoted strings: $tag$...$tag$ (tag may be empty, e.g. $$...$$)
    if (dollarTag !== null) {
      current += ch;
      if (ch === '$' && content.substring(i, i + dollarTag.length) === dollarTag) {
        current += content.substring(i + 1, i + dollarTag.length);
        i += dollarTag.length - 1;
        dollarTag = null;
      }
      continue;
    }

    if (inLineComment) {
      current += ch;
      if (ch === '\n') inLineComment = false;
      continue;
    }

    if (inBlockComment) {
      current += ch;
      if (ch === '*' && next === '/') {
        current += next;
        i++;
        inBlockComment = false;
      }
      continue;
    }

    if (!inSingleQuote && !inDoubleQuote && !inBacktick) {
      if (ch === '$') {
        // Match $tag$ where tag is [a-zA-Z0-9_]* (may be empty for $$)
        const tagMatch = content.substring(i).match(/^\$([a-zA-Z0-9_]*)\$/);
        if (tagMatch) {
          dollarTag = tagMatch[0];
          current += dollarTag;
          i += dollarTag.length - 1;
          continue;
        }
      }
      if (ch === '-' && next === '-') {
        inLineComment = true;
        current += ch;
        continue;
      }
      if (ch === '/' && next === '*') {
        inBlockComment = true;
        current += ch;
        continue;
      }
    }

    if (ch === '\\' && (inSingleQuote || inDoubleQuote)) {
      // Backslash escape: consume the next character as-is.
      current += ch;
      if (i + 1 < content.length) current += content[++i];
      continue;
    } else if (ch === '`' && !inSingleQuote && !inDoubleQuote) {
      // Backtick-quoted identifiers: `` is an escaped backtick inside backticks.
      if (inBacktick && next === '`') {
        current += ch + next;
        i++;
        continue;
      }
      inBacktick = !inBacktick;
    } else if (ch === "'" && !inDoubleQuote && !inBacktick) {
      // SQL-style '' escaped quote: stay inside the string.
      if (inSingleQuote && next === "'") {
        current += ch + next;
        i++;
        continue;
      }
      inSingleQuote = !inSingleQuote;
    } else if (ch === '"' && !inSingleQuote && !inBacktick) {
      if (inDoubleQuote && next === '"') {
        current += ch + next;
        i++;
        continue;
      }
      inDoubleQuote = !inDoubleQuote;
    }

    if (ch === ';' && !inSingleQuote && !inDoubleQuote && !inBacktick) {
      // Consume trailing whitespace and an optional inline comment so they
      // stay with this statement rather than being prepended to the next one.
      // Stop if we hit a non-whitespace, non-comment character (i.e. another
      // statement on the same line).
      let tail = ';';
      let j = i + 1;
      while (j < content.length && content[j] !== '\n') {
        if (content[j] === '-' && content[j + 1] === '-') {
          while (j < content.length && content[j] !== '\n') {
            tail += content[j];
            j++;
          }
          break;
        } else if (content[j] === ' ' || content[j] === '\t') {
          tail += content[j];
          j++;
        } else {
          break;
        }
      }
      i = j - 1;
      statements.push(current + tail);
      current = '';
    } else {
      current += ch;
    }
  }

  if (current.trim()) {
    statements.push(current);
  }

  return statements;
}

// ── Concurrency pool ───────────────────────────────────────────────────────────

class Pool {
  private running = 0;
  private queue: (() => void)[] = [];

  constructor(private limit: number) {}

  run<T>(fn: () => Promise<T>): Promise<T> {
    return new Promise((resolve, reject) => {
      const attempt = () => {
        this.running++;
        fn().then(
          (v) => {
            this.running--;
            this.queue.shift()?.();
            resolve(v);
          },
          (e) => {
            this.running--;
            this.queue.shift()?.();
            reject(e);
          },
        );
      };
      if (this.running < this.limit) {
        attempt();
      } else {
        this.queue.push(attempt);
      }
    });
  }
}

// ── Explain via ClickHouse HTTP interface ──────────────────────────────────────

const pool = new Pool(CONCURRENCY);

// ClickHouse query parameter syntax: {name:Type}
const QUERY_PARAM_RE = /\{\w+:[^}]+\}/;

function runExplain(sql: string): Promise<string> {
  // EXPLAIN AST fails when query parameters are present, so skip explaining these inputs.
  // Strip single-quoted strings before testing to avoid false matches on string literals.
  const sqlOutsideStrings = sql.replace(/'(?:[^']|'')*'/g, "''");
  if (QUERY_PARAM_RE.test(sqlOutsideStrings)) return Promise.resolve(QUERY_PARAMS);

  return pool.run(async () => {
    const query = `EXPLAIN AST ${sql.trim()}`;
    try {
      const response = await fetch(
        `${CLICKHOUSE_URL}/?user=default&password=clickhouse&default_format=Raw&union_default_mode=ALL`,
        {
          method: 'POST',
          body: query,
          signal: AbortSignal.timeout(60_000),
        },
      );

      const text = await response.text();
      if (!response.ok) {
        console.log(`  Explain failed with status ${response.status}:`, text, query);
        return EXPLAIN_ERROR;
      }
      return text;
    } catch (e) {
      console.log(`  Explain error:`, e);
      return EXPLAIN_ERROR;
    }
  });
}

// ── Main ───────────────────────────────────────────────────────────────────────

const filterArg = process.argv[2];

const sqlFiles = readdirSync(dir)
  .filter((f) => f.endsWith('.sql') && !f.includes('.expected.'))
  .filter((f) => !filterArg || f === filterArg || f === `${filterArg}.sql`)
  .sort();

let processed = 0;
let parseErrors = 0;
let explainErrors = 0;

async function processFile(file: string): Promise<void> {
  const filePath = join(dir, file);
  const content = readFileSync(filePath, 'utf8');
  const statements = splitStatements(content)
    .map((s) => s.trim())
    .filter(Boolean);

  // ── AST + formatted SQL ──────────────────────────────────────────────────────

  let ast: Statement[];
  let astOutput: string;
  let formattedOutput: string;

  try {
    ast = parse(content);
    astOutput = JSON.stringify(ast, (key, value) => (key === 'location' || key === 'parent' ? undefined : value), 2);
    try {
      formattedOutput = format(ast);
    } catch (e) {
      formattedOutput = JSON.stringify(e);
      parseErrors++;
    }
  } catch (e) {
    astOutput = JSON.stringify(e);
    formattedOutput = PARSE_ERROR;
    parseErrors++;
  }

  writeFileSync(`${filePath}.expected.ast.json`, astOutput, 'utf8');
  writeFileSync(`${filePath}.expected.formatted.sql`, formattedOutput, 'utf8');

  // ── Explain AST via clickhouse local ─────────────────────────────────────────
  // Skip if the explain file already exists.

  const explainPath = `${filePath}.expected.explain.txt`;
  if (!existsSync(explainPath)) {
    // Run all statements for this file concurrently (throttled by the pool).
    const explainParts = await Promise.all(statements.map(runExplain));

    let hadExplainError = false;
    const trimmedParts = explainParts.map((out) => {
      if (out === PARSE_ERROR) {
        hadExplainError = true;
        return PARSE_ERROR;
      }
      return out.trimEnd();
    });

    if (hadExplainError) explainErrors++;

    const explainOutput = trimmedParts.join('\n\n') + (trimmedParts.length > 0 ? '\n' : '');
    writeFileSync(explainPath, explainOutput, 'utf8');
  }

  processed++;
  if (processed % 50 === 0) {
    console.log(`  ${processed}/${sqlFiles.length} files processed...`);
  }
}

void (async () => {
  await Promise.all(sqlFiles.map(processFile));

  console.log(`Done. Processed ${processed} files.`);
  console.log(`  Parse errors: ${parseErrors}`);
  console.log(`  Explain errors: ${explainErrors}`);
})();
