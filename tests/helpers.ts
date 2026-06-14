import * as fs from 'fs';
import * as path from 'path';

/** Directory holding the ClickHouse reference `.sql` cases and their expected outputs. */
export const CLICKHOUSE_DIR = path.join(__dirname, 'clickhouse-reference');

/**
 * Discovers the reference test cases: every `.sql` file in {@link CLICKHOUSE_DIR}
 * that is not an `.expected.*` output file, sorted for stable ordering.
 */
export function discoverCases(): string[] {
  if (!fs.existsSync(CLICKHOUSE_DIR)) return [];
  return fs
    .readdirSync(CLICKHOUSE_DIR)
    .filter((f) => f.endsWith('.sql') && !f.includes('.expected.'))
    .sort();
}

/**
 * Recursively removes `location` and `parent` keys from objects.
 * Also removes `isOperator` — a surface-syntax marker on desugared operator
 * calls that `format()` intentionally normalizes to explicit function-call
 * syntax, so it does not survive a format/re-parse round-trip.
 * Used to strip AST metadata for snapshot/equality comparisons.
 */
export function stripMeta(value: unknown): unknown {
  if (value === null || value === undefined || typeof value !== 'object') {
    return value;
  }

  if (Array.isArray(value)) {
    return value.map(stripMeta);
  }

  const result: Record<string, unknown> = {};
  for (const [k, v] of Object.entries(value as Record<string, unknown>)) {
    if (k === 'location' || k === 'parent' || k === 'isOperator') continue;
    result[k] = stripMeta(v);
  }
  return result;
}
