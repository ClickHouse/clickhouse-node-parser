CREATE TABLE t0
(
    c0 Tuple(BFloat16)
)
ENGINE = SummingMergeTree()
ORDER BY (c0);

SELECT c0
FROM t0 FINAL;