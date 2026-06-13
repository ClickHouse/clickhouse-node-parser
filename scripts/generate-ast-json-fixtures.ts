#!/usr/bin/env tsx

/**
 * Regenerates the vendored `EXPLAIN AST json = 1` fixtures in
 * tests/clickhouse-reference-ast-json/cases from their `.sql` inputs.
 *
 * Requires a ClickHouse build that contains the JSON AST PR (see the corpus
 * README for the source PR and pinned commit SHA). Point docker-compose at
 * such a build and start it first:
 *
 *   CLICKHOUSE_IMAGE=<image-with-json-ast-pr> docker compose up -d
 *   npm run generate:ast-json-fixtures
 *
 * Until such an image is available the vendored copies are the source of
 * truth — this script will fail against a stock ClickHouse server because it
 * does not understand the `json` EXPLAIN AST option.
 */

import { readFileSync, readdirSync, writeFileSync } from 'fs';
import { join } from 'path';

const CASES_DIR = new URL('../tests/clickhouse-reference-ast-json/cases', import.meta.url)
  .pathname;

const CLICKHOUSE_URL = process.env.CLICKHOUSE_URL || 'http://localhost:8125';
const USER = process.env.CLICKHOUSE_USER || 'default';
const PASSWORD = process.env.CLICKHOUSE_PASSWORD || 'clickhouse';

async function explainASTJSON(sql: string): Promise<string> {
  const url =
    `${CLICKHOUSE_URL}/?user=${encodeURIComponent(USER)}&password=${encodeURIComponent(PASSWORD)}&default_format=Raw&union_default_mode=ALL`;
  const res = await fetch(url, {
    method: 'POST',
    body: `EXPLAIN AST json = 1 ${sql}`,
    signal: AbortSignal.timeout(30_000),
  });
  const text = await res.text();
  if (!res.ok) {
    throw new Error(`HTTP ${res.status}: ${text}`);
  }
  return text;
}

async function main(): Promise<void> {
  const cases = readdirSync(CASES_DIR)
    .filter((f) => f.endsWith('.sql'))
    .sort();
  let failures = 0;
  for (const fileName of cases) {
    const sql = readFileSync(join(CASES_DIR, fileName), 'utf-8').trim();
    const jsonPath = join(CASES_DIR, fileName.replace(/\.sql$/, '.json'));
    try {
      const output = await explainASTJSON(sql);
      writeFileSync(jsonPath, output.trimEnd() + '\n', 'utf-8');
      process.stdout.write(`✓ ${fileName}\n`);
    } catch (e) {
      failures++;
      process.stderr.write(`✗ ${fileName}: ${e instanceof Error ? e.message : String(e)}\n`);
    }
  }
  if (failures > 0) {
    process.stderr.write(
      `\n${failures} case(s) failed. Is a ClickHouse server with the JSON AST PR running ` +
        `at ${CLICKHOUSE_URL}? See tests/clickhouse-reference-ast-json/README.md.\n`,
    );
    process.exit(1);
  }
}

void main();
