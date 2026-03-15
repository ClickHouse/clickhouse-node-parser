CREATE TABLE data
(
    key SimpleAggregateFunction(max, Int)
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    AND key >= -1
WHERE key >= 0;