-- Test for https://github.com/ClickHouse/ClickHouse/issues/83620
SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    n Int
)
ENGINE = MergeTree
ORDER BY n
SETTINGS merge_max_block_size = 0; -- { serverError BAD_ARGUMENTS }

CREATE TABLE t
(
    n Int
)
ENGINE = MergeTree
ORDER BY n
SETTINGS merge_max_block_size = 1;

SYSTEM DROP  TABLE t;