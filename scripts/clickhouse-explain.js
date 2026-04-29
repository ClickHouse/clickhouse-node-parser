#!/usr/bin/env node
'use strict';

// Run EXPLAIN AST against a local ClickHouse server (default http://localhost:8125).
// Usage: npm run explain:ch "<SQL>"

const CLICKHOUSE_URL = process.env.CLICKHOUSE_URL || 'http://localhost:8125';
const USER = process.env.CLICKHOUSE_USER || 'default';
const PASSWORD = process.env.CLICKHOUSE_PASSWORD || 'clickhouse';

const sql = process.argv.slice(2).join(' ');
if (!sql) {
  process.stderr.write('Usage: npm run explain:ch "<SQL>"\n');
  process.exit(1);
}

const url = `${CLICKHOUSE_URL}/?user=${encodeURIComponent(USER)}&password=${encodeURIComponent(PASSWORD)}&default_format=Raw&union_default_mode=ALL`;

fetch(url, {
  method: 'POST',
  body: `EXPLAIN AST ${sql}`,
  signal: AbortSignal.timeout(30_000),
})
  .then(async (res) => {
    const text = await res.text();
    if (!res.ok) {
      process.stderr.write(`HTTP ${res.status}: ${text}`);
      process.exit(1);
    }
    process.stdout.write(text);
  })
  .catch((e) => {
    process.stderr.write(`Request failed: ${e.message}\n`);
    process.exit(1);
  });
