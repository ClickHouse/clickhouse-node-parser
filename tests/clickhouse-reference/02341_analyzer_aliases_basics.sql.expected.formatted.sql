SELECT
    1 AS a,
    a;

SELECT
    (c + 1) AS d,
    (a + 1) AS b,
    1 AS a,
    (b + 1) AS c,
    d;

SELECT
    1 AS x,
    x,
    x + 1;

SELECT
    x,
    x + 1,
    1 AS x;

SELECT
    x,
    1 + ((2 + ((3 AS x))));

SELECT
    a AS b,
    b AS a;

SELECT
    id_alias_2,
    id AS id_alias,
    id_alias AS id_alias_2
FROM test_table;

SELECT
    id_1,
    value_1,
    id AS id_1,
    value AS value_1
FROM test_table;

SELECT
    (id + b) AS id,
    id AS b
FROM test_table;

SELECT
    (1 + b + 1 + id) AS id,
    b AS c,
    id AS b
FROM test_table;

SELECT id AS id
FROM test_table;

SELECT (id + 1) AS id
FROM test_table;

SELECT (id + 1 + 1 + 1 + id) AS id
FROM test_table;