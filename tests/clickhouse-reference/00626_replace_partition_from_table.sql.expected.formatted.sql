CREATE TABLE src
(
    p UInt64,
    k String,
    d UInt64
)
ENGINE = MergeTree
ORDER BY k
PARTITION BY p;

CREATE TABLE dst
(
    p UInt64,
    k String,
    d UInt64
)
ENGINE = MergeTree
ORDER BY k
PARTITION BY p
SETTINGS merge_selector_base = 1000;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO dst;

INSERT INTO dst;

INSERT INTO dst;

SELECT
    count(),
    sum(d)
FROM src;

SELECT
    count(),
    sum(d)
FROM dst;

CREATE TEMPORARY TABLE test_block_numbers
(
    m UInt64
);

INSERT INTO test_block_numbers SELECT max(max_block_number) AS m
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'dst'
    AND active
    AND like(name, '1_%');

SELECT (max(m) - min(m) > 1) AS new_block_is_generated
FROM test_block_numbers;

INSERT INTO src;

INSERT INTO src;

INSERT INTO dst;

SELECT
    count(),
    sum(d),
    uniqExact(_part)
FROM dst;

SET optimize_throw_if_noop = 1;