CREATE TABLE column_size_bug
(
    date_time DateTime,
    value SimpleAggregateFunction(sum,UInt64)
)
ENGINE = AggregatingMergeTree
ORDER BY date_time
PARTITION BY toStartOfInterval(date_time, toIntervalDay(1))
SETTINGS remove_empty_parts = 0;

-- wait for DELETE
SELECT sleep(1);