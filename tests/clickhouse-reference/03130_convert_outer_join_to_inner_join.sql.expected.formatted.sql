SET enable_analyzer = 1;

SET join_algorithm = 'hash';

SYSTEM DROP  TABLE IF EXISTS test_table_1;

CREATE TABLE test_table_1
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 16; # We have number of granules in the `EXPLAIN` output in reference file

SYSTEM DROP  TABLE IF EXISTS test_table_2;

CREATE TABLE test_table_2
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 16;

INSERT INTO test_table_1;

INSERT INTO test_table_2;

SELECT '--';

SELECT *
FROM
    test_table_1 AS lhs
LEFT JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE rhs.id != 0;

SELECT *
FROM
    test_table_1 AS lhs
RIGHT JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE lhs.id != 0;

SELECT *
FROM
    test_table_1 AS lhs
FULL JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE lhs.id != 0
    AND rhs.id != 0;

SYSTEM DROP  TABLE test_table_1;

SYSTEM DROP  TABLE test_table_2;