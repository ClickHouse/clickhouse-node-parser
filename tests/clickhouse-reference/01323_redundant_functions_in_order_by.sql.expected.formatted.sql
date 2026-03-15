SET single_join_prefer_left_table = 0;

CREATE TABLE test
(
    key UInt64,
    a UInt8,
    b String,
    c Float64
)
ENGINE = MergeTree()
ORDER BY key;

SET optimize_redundant_functions_in_order_by = 1;

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            x ASC,
            exp(x) ASC
    );

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            x ASC,
            exp(x) ASC
    )
SETTINGS enable_analyzer = 1;

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            x ASC,
            exp(exp(x)) ASC
    );

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            x ASC,
            exp(exp(x)) ASC
    )
SETTINGS enable_analyzer = 1;

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            exp(x) ASC,
            x ASC
    );

SELECT groupArray(x)
FROM (
        SELECT number AS x
        FROM numbers(3)
        ORDER BY
            exp(x) ASC,
            x ASC
    )
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    (
        SELECT number + 2 AS key
        FROM numbers(4)
    ) AS s
FULL JOIN test AS t
    USING (key)
ORDER BY
    s.key ASC,
    t.key ASC;

SELECT *
FROM
    (
        SELECT number + 2 AS key
        FROM numbers(4)
    ) AS s
FULL JOIN test AS t
    USING (key)
ORDER BY
    s.key ASC,
    t.key ASC
SETTINGS enable_analyzer = 1;

SELECT
    key,
    a
FROM test
ORDER BY
    key ASC,
    a ASC,
    exp(key + a) ASC;

SELECT
    key,
    a
FROM test
ORDER BY
    key ASC,
    a ASC,
    exp(key + a) ASC
SETTINGS enable_analyzer = 1;

SELECT
    key,
    a
FROM test
ORDER BY
    key ASC,
    exp(key + a) ASC;

SELECT
    key,
    a
FROM test
ORDER BY
    key ASC,
    exp(key + a) ASC
SETTINGS enable_analyzer = 1;

CREATE TABLE t1
(
    id UInt64
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE t2
(
    id UInt64
)
ENGINE = MergeTree()
ORDER BY id;

SET optimize_redundant_functions_in_order_by = 0;