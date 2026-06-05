import * as fs from 'fs';
import * as path from 'path';
import { format, parse } from '../src/index';
import { CLICKHOUSE_DIR, discoverCases } from './helpers';

describe('clickhouse reference - format', () => {
  for (const fileName of discoverCases()) {
    const filePath = path.join(CLICKHOUSE_DIR, fileName);
    const formattedPath = `${filePath}.expected.formatted.sql`;

    it(fileName, () => {
      if (!fs.existsSync(formattedPath)) return;

      const sql = fs.readFileSync(filePath, 'utf-8');
      const statements = parse(sql);

      const expectedFormatted = fs.readFileSync(formattedPath, 'utf-8').trimEnd();
      const actual = format(statements).trimEnd();
      expect(actual).toBe(expectedFormatted);
    });
  }
});
