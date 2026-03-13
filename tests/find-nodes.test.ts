import { parse, findNodes } from '../src/index';

describe('findNodes', () => {
  describe('returns empty array', () => {
    it('when no nodes of the given kind exist', () => {
      const stmts = parse('SELECT 1;');
      expect(findNodes(stmts, 'queryParam')).toEqual([]);
      expect(findNodes(stmts, 'tableRef')).toEqual([]);
      expect(findNodes(stmts, 'join')).toEqual([]);
    });
  });

  describe('expression nodes', () => {
    it('finds literals', () => {
      const stmts = parse("SELECT 1, 'hello', 3.14, NULL, true;");
      const literals = findNodes(stmts, 'literal');
      expect(literals.map((l) => l.value)).toEqual(['1', 'hello', '3.14', 'NULL', '1']);
    });

    it('finds column refs', () => {
      const stmts = parse('SELECT a, b, c FROM t;');
      const refs = findNodes(stmts, 'columnRef');
      expect(refs.map((r) => r.parts)).toEqual([['a'], ['b'], ['c']]);
    });

    it('finds qualified column refs', () => {
      const stmts = parse('SELECT t.a, db.t.b FROM t;');
      const refs = findNodes(stmts, 'columnRef');
      expect(refs.map((r) => r.parts)).toEqual([
        ['t', 'a'],
        ['db', 't', 'b'],
      ]);
    });

    it('finds query params', () => {
      const stmts = parse('SELECT {x: UInt64} FROM t WHERE id = {id: String};');
      const params = findNodes(stmts, 'queryParam');
      expect(params).toEqual([
        { kind: 'queryParam', name: 'x', type: 'UInt64' },
        { kind: 'queryParam', name: 'id', type: 'String' },
      ]);
    });

    it('finds function calls', () => {
      const stmts = parse('SELECT count(), sum(x), avg(y) FROM t;');
      const funcs = findNodes(stmts, 'functionCall');
      expect(funcs.map((f) => f.name)).toEqual(['count', 'sum', 'avg']);
    });

    it('finds nested function calls', () => {
      const stmts = parse('SELECT toString(toDate(now()));');
      const funcs = findNodes(stmts, 'functionCall');
      expect(funcs.map((f) => f.name)).toEqual(['toString', 'toDate', 'now']);
    });

    it('finds cast expressions', () => {
      const stmts = parse('SELECT CAST(x AS Int32), y::String FROM t;');
      const casts = findNodes(stmts, 'castExpr');
      expect(casts).toHaveLength(2);
      expect(casts.map((c) => c.type)).toEqual(['Int32', 'String']);
    });

    it('finds lambda expressions', () => {
      const stmts = parse('SELECT arrayMap(x -> x + 1, arr) FROM t;');
      const lambdas = findNodes(stmts, 'lambdaExpr');
      expect(lambdas).toHaveLength(1);
      expect(lambdas[0].params).toEqual(['x']);
    });

    it('finds binary expressions', () => {
      const stmts = parse('SELECT a + b, c * d FROM t;');
      const binExprs = findNodes(stmts, 'binaryExpr');
      expect(binExprs.map((e) => e.op)).toEqual(['+', '*']);
    });

    it('finds nary expressions', () => {
      const stmts = parse('SELECT * FROM t WHERE a AND b AND c;');
      const naryExprs = findNodes(stmts, 'naryExpr');
      expect(naryExprs).toHaveLength(1);
      expect(naryExprs[0].op).toBe('AND');
      expect(naryExprs[0].operands).toHaveLength(3);
    });

    it('finds unary expressions', () => {
      const stmts = parse('SELECT * FROM t WHERE NOT x;');
      const unaryExprs = findNodes(stmts, 'unaryExpr');
      expect(unaryExprs).toHaveLength(1);
      expect(unaryExprs[0].op).toBe('NOT');
    });

    it('finds aliases', () => {
      const stmts = parse('SELECT a AS x, b AS y FROM t;');
      const aliases = findNodes(stmts, 'alias');
      expect(aliases.map((a) => a.alias)).toEqual(['x', 'y']);
    });

    it('finds array literals', () => {
      const stmts = parse('SELECT [1, 2, 3];');
      const arrays = findNodes(stmts, 'array');
      expect(arrays).toHaveLength(1);
      expect(arrays[0].elements).toHaveLength(3);
    });

    it('finds tuple literals', () => {
      const stmts = parse("SELECT (1, 'a', 3.14);");
      const tuples = findNodes(stmts, 'tuple');
      expect(tuples).toHaveLength(1);
      expect(tuples[0].elements).toHaveLength(3);
    });

    it('finds IN expressions', () => {
      const stmts = parse('SELECT * FROM t WHERE x IN (1, 2, 3) AND y NOT IN (4, 5);');
      const inExprs = findNodes(stmts, 'inExpr');
      expect(inExprs).toHaveLength(2);
      expect(inExprs[0].negated).toBe(false);
      expect(inExprs[1].negated).toBe(true);
    });

    it('finds asterisks', () => {
      const stmts = parse('SELECT * FROM t;');
      const asterisks = findNodes(stmts, 'asterisk');
      expect(asterisks).toHaveLength(1);
    });

    it('finds qualified asterisks', () => {
      const stmts = parse('SELECT t.* FROM t;');
      const qualAsterisks = findNodes(stmts, 'qualifiedAsterisk');
      expect(qualAsterisks).toHaveLength(1);
      expect(qualAsterisks[0].parts).toEqual(['t']);
    });

    it('finds subquery expressions', () => {
      const stmts = parse('SELECT * FROM t WHERE x IN (SELECT id FROM t2);');
      const subqueries = findNodes(stmts, 'subqueryExpr');
      expect(subqueries).toHaveLength(1);
    });
  });

  describe('FROM clause nodes', () => {
    it('finds table refs', () => {
      const stmts = parse('SELECT * FROM t1;');
      const tables = findNodes(stmts, 'tableRef');
      expect(tables).toHaveLength(1);
      expect(tables[0].table).toBe('t1');
    });

    it('finds table refs with database qualifier', () => {
      const stmts = parse('SELECT * FROM db.t1;');
      const tables = findNodes(stmts, 'tableRef');
      expect(tables[0].database).toBe('db');
      expect(tables[0].table).toBe('t1');
    });

    it('finds table refs with aliases', () => {
      const stmts = parse('SELECT * FROM my_table AS t;');
      const tables = findNodes(stmts, 'tableRef');
      expect(tables[0].alias).toBe('t');
    });

    it('finds subquery FROM sources', () => {
      const stmts = parse('SELECT * FROM (SELECT 1) AS sub;');
      const subFroms = findNodes(stmts, 'subqueryFrom');
      expect(subFroms).toHaveLength(1);
      expect(subFroms[0].alias).toBe('sub');
    });

    it('finds table function refs', () => {
      const stmts = parse('SELECT * FROM numbers(10);');
      const tableFuncs = findNodes(stmts, 'tableFunction');
      expect(tableFuncs).toHaveLength(1);
      expect(tableFuncs[0].name).toBe('numbers');
    });

    it('finds join nodes', () => {
      const stmts = parse(
        'SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id LEFT JOIN t3 ON t2.id = t3.id;',
      );
      const joins = findNodes(stmts, 'join');
      expect(joins).toHaveLength(2);
    });

    it('finds array join nodes', () => {
      const stmts = parse('SELECT * FROM t ARRAY JOIN arr AS a;');
      const arrayJoins = findNodes(stmts, 'arrayJoin');
      expect(arrayJoins).toHaveLength(1);
      expect(arrayJoins[0].joinType).toBe('ARRAY');
    });

    it('finds all table refs across joins', () => {
      const stmts = parse('SELECT * FROM t1 INNER JOIN t2 ON t1.id = t2.id;');
      const tables = findNodes(stmts, 'tableRef');
      expect(tables.map((t) => t.table)).toEqual(['t1', 't2']);
    });
  });

  describe('statement nodes', () => {
    it('finds select statements', () => {
      const stmts = parse('SELECT 1; SELECT 2;');
      const selects = findNodes(stmts, 'select');
      expect(selects).toHaveLength(2);
    });

    it('finds select statements inside unions', () => {
      const stmts = parse('SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3;');
      const selects = findNodes(stmts, 'select');
      expect(selects).toHaveLength(3);
    });

    it('finds union statements', () => {
      const stmts = parse('SELECT 1 UNION ALL SELECT 2;');
      const unions = findNodes(stmts, 'union');
      expect(unions).toHaveLength(1);
    });

    it('finds intersect statements', () => {
      const stmts = parse('SELECT 1 INTERSECT SELECT 1;');
      const intersects = findNodes(stmts, 'intersect');
      expect(intersects).toHaveLength(1);
      expect(intersects[0].op).toBe('INTERSECT');
    });

    it('finds except statements', () => {
      const stmts = parse('SELECT 1 EXCEPT SELECT 2;');
      const excepts = findNodes(stmts, 'intersect');
      expect(excepts).toHaveLength(1);
      expect(excepts[0].op).toBe('EXCEPT');
    });

    it('finds explain statements', () => {
      const stmts = parse('EXPLAIN AST SELECT 1;');
      const explains = findNodes(stmts, 'explain');
      expect(explains).toHaveLength(1);
      expect(explains[0].explainType).toBe('AST');
    });

    it('finds set statements', () => {
      const stmts = parse('SET max_threads = 4;');
      const sets = findNodes(stmts, 'set');
      expect(sets).toHaveLength(1);
      expect(sets[0].settings[0].name).toBe('max_threads');
    });

    it('finds use statements', () => {
      const stmts = parse('USE my_db;');
      const uses = findNodes(stmts, 'use');
      expect(uses).toHaveLength(1);
      expect(uses[0].database).toBe('my_db');
    });

    it('finds system statements', () => {
      const stmts = parse('SYSTEM FLUSH LOGS;');
      const systems = findNodes(stmts, 'system');
      expect(systems).toHaveLength(1);
    });
  });

  describe('deeply nested nodes', () => {
    it('finds nodes inside nested subqueries', () => {
      const stmts = parse('SELECT * FROM (SELECT a, b FROM (SELECT a, b, c FROM t));');
      const refs = findNodes(stmts, 'columnRef');
      expect(refs.map((r) => r.parts)).toEqual([['a'], ['b'], ['a'], ['b'], ['c']]);
    });

    it('finds nodes inside CTE subqueries', () => {
      const stmts = parse('WITH cte AS (SELECT id FROM t WHERE x > 10) SELECT * FROM cte;');
      const tables = findNodes(stmts, 'tableRef');
      expect(tables.map((t) => t.table)).toEqual(['t', 'cte']);
    });

    it('finds nodes inside CTE expressions', () => {
      const stmts = parse('WITH 1 + 2 AS val SELECT val;');
      const binExprs = findNodes(stmts, 'binaryExpr');
      expect(binExprs).toHaveLength(1);
      expect(binExprs[0].op).toBe('+');
    });

    it('finds nodes inside IN subqueries', () => {
      const stmts = parse(
        'SELECT * FROM t WHERE x IN (SELECT id FROM t2 WHERE y = {val: UInt64});',
      );
      const params = findNodes(stmts, 'queryParam');
      expect(params).toHaveLength(1);
      expect(params[0].name).toBe('val');
    });

    it('finds nodes in HAVING clause', () => {
      const stmts = parse('SELECT x, count() AS cnt FROM t GROUP BY x HAVING cnt > 10;');
      const literals = findNodes(stmts, 'literal');
      expect(literals.map((l) => l.value)).toContain('10');
    });

    it('finds nodes in ORDER BY expressions', () => {
      const stmts = parse('SELECT * FROM t ORDER BY a + b ASC;');
      const binExprs = findNodes(stmts, 'binaryExpr');
      expect(binExprs).toHaveLength(1);
      expect(binExprs[0].op).toBe('+');
    });

    it('finds nodes in PREWHERE clause', () => {
      const stmts = parse('SELECT * FROM t PREWHERE x > 5;');
      const binExprs = findNodes(stmts, 'binaryExpr');
      expect(binExprs).toHaveLength(1);
    });

    it('finds nodes in LIMIT and OFFSET', () => {
      const stmts = parse('SELECT * FROM t LIMIT {n: UInt64} OFFSET {off: UInt64};');
      const params = findNodes(stmts, 'queryParam');
      expect(params.map((p) => p.name)).toEqual(['n', 'off']);
    });

    it('finds nodes in GROUP BY expressions', () => {
      const stmts = parse('SELECT toDate(ts), count() FROM t GROUP BY toDate(ts);');
      const funcs = findNodes(stmts, 'functionCall');
      const toDateCalls = funcs.filter((f) => f.name === 'toDate');
      expect(toDateCalls).toHaveLength(2);
    });

    it('finds nodes in JOIN ON conditions', () => {
      const stmts = parse('SELECT * FROM t1 INNER JOIN t2 ON toUInt64(t1.id) = toUInt64(t2.id);');
      const funcs = findNodes(stmts, 'functionCall');
      expect(funcs.map((f) => f.name)).toEqual(['toUInt64', 'toUInt64']);
    });

    it('finds nodes in SETTINGS clause', () => {
      const stmts = parse('SELECT * FROM t SETTINGS max_threads = {threads: UInt64};');
      const params = findNodes(stmts, 'queryParam');
      expect(params).toHaveLength(1);
      expect(params[0].name).toBe('threads');
    });
  });

  describe('multiple statements', () => {
    it('finds nodes across multiple statements', () => {
      const stmts = parse('SELECT 1; SELECT 2; SELECT 3;');
      const literals = findNodes(stmts, 'literal');
      expect(literals.map((l) => l.value)).toEqual(['1', '2', '3']);
    });

    it('finds nodes across mixed statement types', () => {
      const stmts = parse('SET max_threads = 4; SELECT * FROM t;');
      const literals = findNodes(stmts, 'literal');
      expect(literals.map((l) => l.value)).toContain('4');
    });
  });
});
