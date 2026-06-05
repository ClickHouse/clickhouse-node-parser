import * as fs from 'fs';
import * as path from 'path';
import { parse } from '../src/index';
import { CLICKHOUSE_DIR, discoverCases, stripMeta } from './helpers';

describe('clickhouse reference - ast', () => {
  for (const fileName of discoverCases()) {
    const filePath = path.join(CLICKHOUSE_DIR, fileName);
    const astPath = `${filePath}.expected.ast.json`;

    it(fileName, () => {
      if (!fs.existsSync(astPath)) return;

      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const expectedAst = JSON.parse(fs.readFileSync(astPath, 'utf-8'));
      expect(stripMeta(statements)).toEqual(expectedAst);
    });
  }
});
