import * as fs from 'fs';
import * as path from 'path';
import { format, formatExplain, parse } from '../src/index';
import { stripMeta } from './helpers';

const CLICKHOUSE_DIR = path.join(__dirname, 'clickhouse-reference');
const QUERY_PARAMS = '<Query Parameters>';
const EXPLAIN_ERROR = '<Explain Error>';

function discoverCases(): string[] {
  if (!fs.existsSync(CLICKHOUSE_DIR)) return [];
  return fs
    .readdirSync(CLICKHOUSE_DIR)
    .filter((f) => f.endsWith('.sql') && !f.includes('.expected.'))
    .sort();
}

describe('clickhouse tests', () => {
  const cases = discoverCases();

  if (cases.length === 0) {
    it('no clickhouse test cases found', () => {
      expect(true).toBe(true);
    });
  }

  for (const fileName of cases) {
    const filePath = path.join(CLICKHOUSE_DIR, fileName);
    const explainPath = `${filePath}.expected.explain.txt`;
    const astPath = `${filePath}.expected.ast.json`;
    const formattedPath = `${filePath}.expected.formatted.sql`;

    it.only(`${fileName} - explain`, () => {
      if (!fs.existsSync(explainPath)) return;

      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const expectedEntries = fs.readFileSync(explainPath, 'utf-8').trimEnd().split('\n\n');
      for (let i = 0; i < expectedEntries.length; i++) {
        const expected = expectedEntries[i].trimEnd();
        if (expected === QUERY_PARAMS) continue;
        if (expected === EXPLAIN_ERROR) continue;
        const actual = formatExplain([statements[i]]).trimEnd();
        expect(actual).toBe(expected);
      }
    });

    it(`${fileName} - ast`, () => {
      if (!fs.existsSync(astPath)) return;

      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const expectedAst = JSON.parse(fs.readFileSync(astPath, 'utf-8'));
      expect(stripMeta(statements)).toEqual(expectedAst);
    });

    it(`${fileName} - format`, () => {
      if (!fs.existsSync(formattedPath)) return;

      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const expectedFormatted = fs.readFileSync(formattedPath, 'utf-8').trimEnd();
      const actual = format(statements).trimEnd();
      expect(actual).toBe(expectedFormatted);
    });

    it(`${fileName} - round-trip`, () => {
      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const sqlFormatted = format(statements);
      const reparsed = parse(sqlFormatted);
      expect(stripMeta(reparsed)).toEqual(stripMeta(statements));
    });
  }
});
