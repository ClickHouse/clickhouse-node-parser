SELECT 1 as a, a;
SELECT (c + 1) as d, (a + 1) as b, 1 AS a, (b + 1) as c, d;
SELECT 1 AS x, x, x + 1;
SELECT x, x + 1, 1 AS x;
SELECT x, 1 + (2 + (3 AS x));
SELECT a AS b, b AS a; -- { serverError CYCLIC_ALIASES, UNKNOWN_IDENTIFIER }
SELECT id_alias_2, id AS id_alias, id_alias as id_alias_2 FROM test_table;
SELECT id_1, value_1, id as id_1, value as value_1 FROM test_table;
SELECT (id + b) AS id, id as b FROM test_table; -- { serverError CYCLIC_ALIASES, UNKNOWN_IDENTIFIER }
SELECT (1 + b + 1 + id) AS id, b as c, id as b FROM test_table; -- { serverError CYCLIC_ALIASES, UNKNOWN_IDENTIFIER }
SELECT id AS id FROM test_table;
SELECT (id + 1) AS id FROM test_table;
SELECT (id + 1 + 1 + 1 + id) AS id FROM test_table;
