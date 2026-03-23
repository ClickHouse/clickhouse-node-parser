CREATE TABLE t
(
    x UInt8,
    PROJECTION p (    SELECT x
    GROUP BY x)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS enable_block_number_column = 1;

INSERT INTO t;

INSERT INTO t;

INSERT INTO t;

SELECT x
FROM t
GROUP BY x
ORDER BY x ASC;

SELECT
    x,
    _block_number
FROM t;

INSERT INTO t;