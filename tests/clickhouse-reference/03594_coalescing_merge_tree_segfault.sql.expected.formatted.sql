CREATE TABLE t0
(
    c0 String
)
ENGINE = CoalescingMergeTree()
ORDER BY tuple();

INSERT INTO t0 (c0);

SELECT *
FROM t0;