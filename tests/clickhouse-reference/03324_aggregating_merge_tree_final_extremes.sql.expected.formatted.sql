-- { echoOn }
CREATE TABLE t03324
(
    c0 Nullable(Int)
)
ENGINE = AggregatingMergeTree()
ORDER BY (c0)
PARTITION BY (c0)
SETTINGS allow_nullable_key = 1;

INSERT INTO t03324 (c0);

SELECT c0
FROM t03324 FINAL
ORDER BY c0 DESC
SETTINGS extremes = 1;