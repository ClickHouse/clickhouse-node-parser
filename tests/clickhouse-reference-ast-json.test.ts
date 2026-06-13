import * as fs from 'fs';
import * as path from 'path';
import { explainJSON, parse } from '../src/index';

/**
 * Reference suite for `formatExplainJSON()` / `explainJSON()` against the
 * vendored ClickHouse `EXPLAIN AST json = 1` corpus.
 *
 * Each `cases/<name>.sql` is parsed with this library, converted with
 * `explainJSON()`, and the `ast` payload is deep-compared against the
 * pretty-printed reference output in `cases/<name>.json` (see the README in
 * the corpus directory for the source PR and pinned commit SHA).
 */

const CASES_DIR = path.join(__dirname, 'clickhouse-reference-ast-json', 'cases');

/**
 * Known divergences from the reference output. Map of case basename (without
 * extension) to the reason it is skipped. Keep this list empty when possible;
 * document the cause when not.
 */
const SKIP: Record<string, string> = {};

function discoverJSONCases(): string[] {
  if (!fs.existsSync(CASES_DIR)) return [];
  return fs
    .readdirSync(CASES_DIR)
    .filter((f) => f.endsWith('.sql'))
    .map((f) => f.replace(/\.sql$/, ''))
    .sort();
}

describe('clickhouse reference - ast json', () => {
  for (const name of discoverJSONCases()) {
    const skipReason = SKIP[name];
    const testFn = skipReason ? it.skip : it;
    testFn(skipReason ? `${name} (skipped: ${skipReason})` : name, () => {
      const sql = fs.readFileSync(path.join(CASES_DIR, `${name}.sql`), 'utf-8');
      const expected = JSON.parse(fs.readFileSync(path.join(CASES_DIR, `${name}.json`), 'utf-8'));

      const statements = parse(sql);
      expect(statements).toHaveLength(1);

      const document = explainJSON(statements[0]);
      expect(document.version).toBe(1);
      // Round-trip through JSON to drop undefined values and compare structurally.
      const actual = JSON.parse(JSON.stringify(document.ast));
      // The vendored fixtures at the pinned SHA are the bare AST node; the
      // `{version, ast}` wrapper is part of the documented v1 contract.
      expect(actual).toEqual('ast' in expected ? expected.ast : expected);
    });
  }
});
