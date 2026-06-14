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
 * When explain outputs need to be (re)generated, this script will start a
 * ClickHouse container via `docker compose up -d`, wait for it to be ready,
 * and stop it again (`docker compose down`) on exit. If a ClickHouse server is
 * already running at CLICKHOUSE_URL, it is reused and left running.
 *
 * Usage:
 *   tsx scripts/generate-expected-outputs.ts [<file>] [--regenerate-explains | --regenerate-changed-explains]
 *
 *   <file>                          Optional .sql filename to limit processing to a single input.
 *   --regenerate-explains           Regenerate the explain output for every input, overwriting
 *                                   any existing .expected.explain.txt files. By default, inputs
 *                                   that already have an explain file are skipped (since the
 *                                   explain output is a reference from ClickHouse itself and
 *                                   does not change with library changes).
 *   --regenerate-changed-explains   Regenerate the explain output only for input .sql files
 *                                   that have uncommitted changes (staged, working-tree, or
 *                                   untracked) according to `git status`. Useful when adding
 *                                   or editing a handful of test cases.
 */

import { spawnSync } from 'child_process';
import { readFileSync, writeFileSync, readdirSync, existsSync } from 'fs';
import { join } from 'path';
import { parse, format, Statement } from '../src/index.js';
import { splitStatements } from './split-statements.js';

const PARSE_ERROR = '<Parse Error>';
const EXPLAIN_ERROR = '<Explain Error>';
const QUERY_PARAMS = '<Query Parameters>';

const dir = new URL('../tests/clickhouse-reference', import.meta.url).pathname;
const projectRoot = new URL('..', import.meta.url).pathname;

// ClickHouse HTTP endpoint (matches the port mapping in docker-compose.yml).
const CLICKHOUSE_URL = 'http://localhost:8125';

// Maximum number of concurrent HTTP requests to the ClickHouse server.
const CONCURRENCY = 20;

// How long to wait for the ClickHouse container to start accepting connections.
const CLICKHOUSE_READY_TIMEOUT_MS = 120_000;

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

// ── Docker compose lifecycle ──────────────────────────────────────────────────

function runDocker(args: string[]): void {
  const result = spawnSync('docker', args, { stdio: 'inherit', cwd: projectRoot });
  if (result.error) {
    throw new Error(`Failed to run \`docker ${args.join(' ')}\`: ${result.error.message}`);
  }
  if (result.status !== 0) {
    throw new Error(`\`docker ${args.join(' ')}\` exited with status ${result.status}`);
  }
}

async function isClickHouseUp(): Promise<boolean> {
  try {
    const r = await fetch(`${CLICKHOUSE_URL}/ping`, { signal: AbortSignal.timeout(2_000) });
    return r.ok;
  } catch {
    return false;
  }
}

async function waitForClickHouse(timeoutMs: number): Promise<void> {
  const start = Date.now();
  while (Date.now() - start < timeoutMs) {
    if (await isClickHouseUp()) return;
    await new Promise((r) => setTimeout(r, 500));
  }
  throw new Error(`ClickHouse not reachable at ${CLICKHOUSE_URL} after ${timeoutMs}ms`);
}

// ── Git: changed input files ──────────────────────────────────────────────────

const REF_PATH_PREFIX = 'tests/clickhouse-reference/';

/**
 * Returns the set of input `.sql` filenames (basenames, not paths) in the
 * reference directory that have uncommitted changes — staged, working-tree,
 * or untracked. `.expected.*` files and non-`.sql` files are ignored, since
 * we only care about whether the input itself changed.
 */
function getChangedInputFiles(): Set<string> {
  const result = spawnSync('git', ['status', '--porcelain', '--', REF_PATH_PREFIX], {
    cwd: projectRoot,
    encoding: 'utf8',
  });
  if (result.error) {
    throw new Error(`Failed to run \`git status\`: ${result.error.message}`);
  }
  if (result.status !== 0) {
    throw new Error(`\`git status\` exited with status ${result.status}: ${result.stderr}`);
  }

  const changed = new Set<string>();
  for (const line of result.stdout.split('\n')) {
    if (!line) continue;
    // Porcelain format: "XY path" (2 status chars + space). For renames the
    // path is "old -> new"; we want the new path.
    let path = line.slice(3);
    const arrow = path.lastIndexOf(' -> ');
    if (arrow >= 0) path = path.slice(arrow + 4);
    // Git quotes paths containing special characters; strip the surrounding
    // quotes if present. (We don't bother decoding the inner escapes since
    // none of the reference filenames contain special characters.)
    if (path.startsWith('"') && path.endsWith('"')) path = path.slice(1, -1);

    if (!path.startsWith(REF_PATH_PREFIX)) continue;
    const file = path.slice(REF_PATH_PREFIX.length);
    if (!file.endsWith('.sql') || file.includes('.expected.')) continue;
    changed.add(file);
  }
  return changed;
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

const KNOWN_FLAGS = new Set(['--regenerate-explains', '--regenerate-changed-explains']);

const args = process.argv.slice(2);
const regenerateExplains = args.includes('--regenerate-explains');
const regenerateChangedExplains = args.includes('--regenerate-changed-explains');
const filterArg = args.find((a) => !a.startsWith('--'));

const unknownFlags = args.filter((a) => a.startsWith('--') && !KNOWN_FLAGS.has(a));
if (unknownFlags.length > 0) {
  console.error(`Unknown flag(s): ${unknownFlags.join(', ')}`);
  process.exit(1);
}

if (regenerateExplains && regenerateChangedExplains) {
  console.error(`--regenerate-explains and --regenerate-changed-explains are mutually exclusive.`);
  process.exit(1);
}

// Compute the set of input files with uncommitted changes once up front.
// Empty if --regenerate-changed-explains was not passed.
const changedInputs = regenerateChangedExplains ? getChangedInputFiles() : new Set<string>();
if (regenerateChangedExplains) {
  console.log(
    `--regenerate-changed-explains: ${changedInputs.size} input file(s) changed per \`git status\`.`,
  );
}

/** True when the explain file for this input should be (re)generated. */
function shouldRegenerateExplain(file: string, explainPath: string): boolean {
  if (regenerateExplains) return true;
  if (regenerateChangedExplains && changedInputs.has(file)) return true;
  return !existsSync(explainPath);
}

const sqlFiles = readdirSync(dir)
  .filter((f) => f.endsWith('.sql') && !f.includes('.expected.'))
  .filter((f) => !filterArg || f === filterArg || f === `${filterArg}.sql`)
  .sort();

let processed = 0;
let parseErrors = 0;
let explainErrors = 0;
let explainsWritten = 0;

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
    astOutput = JSON.stringify(ast, (key, value) => (key === 'location' || key === 'parent' || key === 'isOperator' ? undefined : value), 2);
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
  // By default, skip if the explain file already exists. Pass
  // --regenerate-explains to overwrite every existing explain file, or
  // --regenerate-changed-explains to overwrite only those whose input has
  // uncommitted git changes.

  const explainPath = `${filePath}.expected.explain.txt`;
  if (shouldRegenerateExplain(file, explainPath)) {
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
    explainsWritten++;
  }

  processed++;
  if (processed % 50 === 0) {
    console.log(`  ${processed}/${sqlFiles.length} files processed...`);
  }
}

void (async () => {
  // Decide whether we need ClickHouse at all. If every input already has an
  // explain file and nothing forces a regeneration, we can skip docker entirely.
  const needsClickHouse = sqlFiles.some((f) =>
    shouldRegenerateExplain(f, `${join(dir, f)}.expected.explain.txt`),
  );

  let weStartedDocker = false;
  const stopDocker = (): void => {
    if (!weStartedDocker) return;
    weStartedDocker = false;
    console.log('Stopping ClickHouse via `docker compose down`...');
    try {
      runDocker(['compose', 'down']);
    } catch (e) {
      console.error(`  Failed to stop ClickHouse:`, e);
    }
  };

  if (needsClickHouse) {
    if (await isClickHouseUp()) {
      console.log(`Reusing existing ClickHouse server at ${CLICKHOUSE_URL}.`);
    } else {
      console.log('Starting ClickHouse via `docker compose up -d`...');
      runDocker(['compose', 'up', '-d']);
      weStartedDocker = true;

      // Make sure we tear the container down on Ctrl+C or kill so we don't
      // leave it running after an interrupted run.
      const onSignal = (signal: NodeJS.Signals, exitCode: number) => {
        console.log(`\nCaught ${signal}, stopping ClickHouse...`);
        stopDocker();
        process.exit(exitCode);
      };
      process.once('SIGINT', () => onSignal('SIGINT', 130));
      process.once('SIGTERM', () => onSignal('SIGTERM', 143));

      console.log(`Waiting for ClickHouse to be ready at ${CLICKHOUSE_URL}...`);
      await waitForClickHouse(CLICKHOUSE_READY_TIMEOUT_MS);
      console.log('ClickHouse is ready.');
    }
  }

  try {
    await Promise.all(sqlFiles.map(processFile));
  } finally {
    stopDocker();
  }

  console.log(`Done. Processed ${processed} files.`);
  console.log(`  Explain files written: ${explainsWritten}`);
  console.log(`  Parse errors: ${parseErrors}`);
  console.log(`  Explain errors: ${explainErrors}`);
})();
