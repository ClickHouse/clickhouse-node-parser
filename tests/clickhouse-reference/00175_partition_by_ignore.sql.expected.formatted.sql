SELECT '-- check that partition key with ignore works correctly';

CREATE TABLE partition_by_ignore
(
    ts DateTime,
    ts_2 DateTime
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (toYYYYMM(ts), ignore(ts_2))
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';