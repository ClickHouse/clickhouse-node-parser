-- It is special because actions cannot be reused for SimpleAggregateFunction (see https://github.com/ClickHouse/ClickHouse/pull/54436)
DROP TABLE IF EXISTS data;

CREATE TABLE data
(
    key SimpleAggregateFunction(max, Int)
)
ENGINE = AggregatingMergeTree()
ORDER BY tuple();

INSERT INTO data;

SELECT *
FROM data FINAL
PREWHERE indexHint(_partition_id = 'all')
    AND key >= -1
WHERE key >= 0;