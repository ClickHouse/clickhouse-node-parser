import { parse, transformNodes, findNodes, format } from '../src/index';

describe('transformNodes', () => {
  describe('returns unchanged AST when visitor is identity', () => {
    it('returns the same array reference when nothing changes', () => {
      const stmts = parse('SELECT 1');
      const result = transformNodes(stmts, 'literal', (n) => n);
      expect(result).toBe(stmts);
    });

    it('returns same reference for query with params', () => {
      const stmts = parse('SELECT {x:UInt64}');
      const result = transformNodes(stmts, 'queryParam', (n) => n);
      expect(result).toBe(stmts);
    });
  });

  describe('transforms nodes of the same kind', () => {
    it('renames query parameters', () => {
      const stmts = parse('SELECT {x:UInt64}, {y:String}');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: `p_${n.name}`,
      }));
      const params = findNodes(result, 'queryParam');
      expect(params.map((p) => p.name)).toEqual(['p_x', 'p_y']);
    });

    it('changes literal values', () => {
      const stmts = parse('SELECT 1, 2, 3');
      const result = transformNodes(stmts, 'literal', (n) => ({
        ...n,
        value: String(Number(n.value) * 10),
      }));
      const literals = findNodes(result, 'literal');
      expect(literals.map((l) => l.value)).toEqual(['10', '20', '30']);
    });

    it('renames column references', () => {
      const stmts = parse('SELECT a, b FROM t');
      const result = transformNodes(stmts, 'columnRef', (n) => ({
        ...n,
        parts: n.parts.map((p) => (typeof p === 'string' ? p.toUpperCase() : p)),
      }));
      const cols = findNodes(result, 'columnRef');
      expect(cols.map((c) => c.parts)).toEqual([['A'], ['B']]);
    });

    it('renames table references', () => {
      const stmts = parse('SELECT * FROM old_table');
      const result = transformNodes(stmts, 'tableRef', (n) => ({
        ...n,
        table: 'new_table',
      }));
      expect(format(result)).toBe('SELECT *\nFROM new_table;');
    });
  });

  describe('replaces node with a different kind in the same position', () => {
    it('replaces query param with a literal', () => {
      const stmts = parse('SELECT {x:UInt64}');
      const result = transformNodes(stmts, 'queryParam', () => ({
        kind: 'literal' as const,
        type: 'UInt64' as const,
        value: '42',
      }));
      expect(findNodes(result, 'queryParam')).toHaveLength(0);
      expect(findNodes(result, 'literal').map((l) => l.value)).toContain('42');
    });

    it('replaces column ref with a function call', () => {
      const stmts = parse('SELECT a FROM t');
      const result = transformNodes(stmts, 'columnRef', (n) => ({
        kind: 'functionCall' as const,
        name: 'toString',
        args: [{ ...n }],
      }));
      const funcs = findNodes(result, 'functionCall');
      expect(funcs.map((f) => f.name)).toContain('toString');
      expect(format(result)).toBe('SELECT toString(a)\nFROM t;');
    });

    it('replaces a query param in a WHERE clause and formats correctly', () => {
      const stmts = parse('SELECT * FROM t WHERE x = {id:UInt64}');
      const result = transformNodes(stmts, 'queryParam', () => ({
        kind: 'literal' as const,
        type: 'String' as const,
        value: 'abc',
      }));
      expect(format(result)).toBe("SELECT *\nFROM t\nWHERE x = 'abc';");
    });
  });

  describe('immutability', () => {
    it('does not mutate the original AST', () => {
      const stmts = parse('SELECT {x:UInt64}');
      const original = findNodes(stmts, 'queryParam')[0].name;

      transformNodes(stmts, 'queryParam', (n) => ({ ...n, name: 'replaced' }));

      expect(findNodes(stmts, 'queryParam')[0].name).toBe(original);
    });

    it('shares unchanged subtrees with the original', () => {
      const stmts = parse('SELECT a FROM t WHERE x = {p:UInt64}');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: 'new_p',
      }));

      const origTable = findNodes(stmts, 'tableRef')[0];
      const newTable = findNodes(result, 'tableRef')[0];
      expect(newTable).toBe(origTable);
    });
  });

  describe('deeply nested nodes', () => {
    it('transforms inside subqueries', () => {
      const stmts = parse('SELECT * FROM (SELECT {x:UInt64})');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        type: 'String',
      }));
      const params = findNodes(result, 'queryParam');
      expect(params[0].type).toBe('String');
    });

    it('transforms inside CTEs', () => {
      const stmts = parse('WITH cte AS (SELECT {x:UInt64}) SELECT * FROM cte');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: 'renamed',
      }));
      const params = findNodes(result, 'queryParam');
      expect(params[0].name).toBe('renamed');
    });

    it('transforms inside JOIN ON conditions', () => {
      const stmts = parse('SELECT * FROM t1 JOIN t2 ON t1.id = {p:UInt64}');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: 'join_param',
      }));
      const params = findNodes(result, 'queryParam');
      expect(params[0].name).toBe('join_param');
    });
  });

  describe('formatting round-trip', () => {
    it('produces valid SQL after transforming table names', () => {
      const stmts = parse('SELECT a, b FROM old_db.old_table WHERE x > 1');
      const result = transformNodes(stmts, 'tableRef', (n) => ({
        ...n,
        database: 'new_db',
        table: 'new_table',
      }));
      expect(format(result)).toBe('SELECT\n    a,\n    b\nFROM new_db.new_table\nWHERE x > 1;');
    });

    it('produces valid SQL after transforming query params', () => {
      const stmts = parse('SELECT * FROM t WHERE id = {id:UInt64} AND name = {name:String}');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: `v_${n.name}`,
      }));
      expect(format(result)).toBe(
        'SELECT *\nFROM t\nWHERE id = {v_id:UInt64}\n    AND name = {v_name:String};',
      );
    });
  });

  describe('multiple statements', () => {
    it('transforms across multiple statements', () => {
      const stmts = parse('SELECT {a:UInt64}; SELECT {b:String}');
      const result = transformNodes(stmts, 'queryParam', (n) => ({
        ...n,
        name: n.name.toUpperCase(),
      }));
      const params = findNodes(result, 'queryParam');
      expect(params.map((p) => p.name)).toEqual(['A', 'B']);
    });
  });
});
