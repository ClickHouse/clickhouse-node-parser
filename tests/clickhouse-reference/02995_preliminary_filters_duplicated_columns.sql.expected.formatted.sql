-- It is special because actions cannot be reused for SimpleAggregateFunction (see https://github.com/ClickHouse/ClickHouse/pull/54436)
DROP TABLE IF EXISTS data;

CREATE TABLE data
(
    key Int
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

INSERT INTO data;

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all')
    OR indexHint(_partition_id = 'all');