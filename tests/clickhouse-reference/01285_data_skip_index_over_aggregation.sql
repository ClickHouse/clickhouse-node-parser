SET optimize_on_insert = 0;
SET max_threads=1;
CREATE TABLE data_01285 (
    key   Int,
    value SimpleAggregateFunction(max, Nullable(Int)),
    INDEX value_idx assumeNotNull(value) TYPE minmax GRANULARITY 1
)
ENGINE=AggregatingMergeTree()
ORDER BY key;
SELECT * FROM data_01285;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 1;
SELECT * FROM data_01285 ORDER BY ALL;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 1 ORDER BY ALL;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 3 ORDER BY ALL;
-- before the fix value_idx contains one range {0, 0}
-- and hence cannot find these record.
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 3;
