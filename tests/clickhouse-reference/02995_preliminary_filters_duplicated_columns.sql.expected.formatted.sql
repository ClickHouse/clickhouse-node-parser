CREATE TABLE data
(
    key Int
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');