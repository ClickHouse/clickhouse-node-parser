CREATE TABLE t1
(
    v UInt64
)
ENGINE = ReplicatedMergeTree('/test/tables/{database}/test/t1', 'r1')
ORDER BY v
PARTITION BY v;

INSERT INTO t1;

INSERT INTO t1;

SELECT
    _part,
    *
FROM t1;

SELECT count()
FROM t1;