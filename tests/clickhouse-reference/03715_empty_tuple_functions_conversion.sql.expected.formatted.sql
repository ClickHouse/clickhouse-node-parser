SELECT CAST(tuple(), 'SimpleAggregateFunction(min, Tuple())');

CREATE TABLE tab
(
    c0 Tuple()
)
ENGINE = Memory;

SELECT CAST(c0, 'SimpleAggregateFunction(min, Tuple())')
FROM tab;

CREATE TABLE t0
(
    c0 SimpleAggregateFunction(min, Tuple())
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t0;

CREATE TABLE t1
(
    c0 SimpleAggregateFunction(min, Tuple())
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SELECT *
FROM t1;