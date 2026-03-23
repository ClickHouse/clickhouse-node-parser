-- Tags: memory-engine
SYSTEM drop  table if exists t_row_exists;

CREATE TABLE t_row_exists
(
    a int,
    _row_exists int
)
ENGINE = MergeTree
ORDER BY a; --{serverError ILLEGAL_COLUMN}

CREATE TABLE t_row_exists
(
    a int,
    b int
)
ENGINE = MergeTree
ORDER BY a;

SYSTEM drop  table t_row_exists;

CREATE TABLE t_row_exists
(
    a int,
    _row_exists int
)
ENGINE = Memory;

INSERT INTO t_row_exists;

SELECT *
FROM t_row_exists;

CREATE TABLE t_row_exists
(
    a int,
    b int
)
ENGINE = Memory;