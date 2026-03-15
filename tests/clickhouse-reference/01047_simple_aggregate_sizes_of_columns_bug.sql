CREATE TABLE column_size_bug (date_time DateTime, value SimpleAggregateFunction(sum,UInt64)) ENGINE = AggregatingMergeTree PARTITION BY toStartOfInterval(date_time, INTERVAL 1 DAY) ORDER BY (date_time) SETTINGS remove_empty_parts = 0;
-- wait for DELETE
SELECT sleep(1);
