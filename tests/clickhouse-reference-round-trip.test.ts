import * as fs from 'fs';
import * as path from 'path';
import { format, parse } from '../src/index';
import { CLICKHOUSE_DIR, discoverCases, stripMeta } from './helpers';

describe('clickhouse reference - round-trip', () => {
  for (const fileName of discoverCases()) {
    const filePath = path.join(CLICKHOUSE_DIR, fileName);

    it(fileName, () => {
      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const sqlFormatted = format(statements);
      const reparsed = parse(sqlFormatted);
      expect(stripMeta(reparsed)).toEqual(stripMeta(statements));
    });
  }
});
