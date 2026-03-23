SYSTEM DROP  TABLE IF EXISTS t;

CREATE TABLE t
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t SELECT number
FROM numbers(10);

SELECT *
FROM t;

SET mutations_sync = 1;

SELECT '---';

SYSTEM DROP  TABLE t;