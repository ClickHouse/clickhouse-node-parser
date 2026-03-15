-- Tags: no-random-merge-tree-settings

SET send_logs_level = 'fatal';
SELECT '----00489----';
-- NOTE: here the timezone is pinned to UTC, to avoid issues with "partial
-- timezones" (timezones that does not starts from 00:00), like
-- Africa/Monrovia, for which toStartOfMinute(0) and toStartOfMinute(59) can
-- give different values:
--
--     SELECT
--         toDateTime(0, 'Africa/Monrovia') AS sec0,
--         toDateTime(59, 'Africa/Monrovia') AS sec59
--
--     ┌────────────────sec0─┬───────────────sec59─┐
--     │ 1969-12-31 23:15:30 │ 1969-12-31 23:16:29 │
--     └─────────────────────┴─────────────────────┘
--
CREATE TABLE pk (d Date DEFAULT '2000-01-01', x DateTime, y UInt64, z UInt64) ENGINE = MergeTree() PARTITION BY d ORDER BY (toStartOfMinute(x, 'UTC'), y, z) SETTINGS index_granularity_bytes=19, min_index_granularity_bytes=9, write_final_mark = 0; -- one row granule
SET max_block_size = 1;
-- Test inferred limit
SET max_rows_to_read = 5;
SELECT toUInt32(x), y, z FROM pk WHERE x BETWEEN toDateTime(0) AND toDateTime(59);
SET max_rows_to_read = 9;
SELECT toUInt32(x), y, z FROM pk WHERE x BETWEEN toDateTime(120) AND toDateTime(240);
SELECT toUInt32(x), y, z FROM pk WHERE x = toDateTime(1);
-- Index works on interval 00:01:00 - 00:01:59
SET max_rows_to_read = 4;
SELECT toUInt32(x), y, z FROM pk WHERE (x BETWEEN toDateTime(60) AND toDateTime(119)) AND y = 11;
SELECT toUInt32(x), y, z FROM pk WHERE (x BETWEEN toDateTime(60) AND toDateTime(120)) AND y = 11;
SET max_block_size = 8192;
SET max_rows_to_read = 0;
CREATE TABLE merge_tree (x UInt32) ENGINE = MergeTree ORDER BY x SETTINGS index_granularity_bytes = 4, min_index_granularity_bytes=1, write_final_mark = 0;
SET force_primary_key = 1;
SET max_rows_to_read = 1;
SELECT count() FROM merge_tree WHERE x = 0;
SELECT count() FROM merge_tree WHERE toUInt32(x) = 0;
SELECT count() FROM merge_tree WHERE toUInt64(x) = 0;
SELECT count() FROM merge_tree WHERE x IN (0, 0);
SELECT count() FROM merge_tree WHERE toUInt32(x) IN (0, 0);
SELECT count() FROM merge_tree WHERE toUInt64(x) IN (0, 0);
SET force_primary_key = 0;
SET allow_suspicious_codecs = 1;
CREATE TABLE large_alter_table_00926 (
    somedate Date CODEC(ZSTD, ZSTD, ZSTD(12), LZ4HC(12)),
    id UInt64 CODEC(LZ4, ZSTD, NONE, LZ4HC),
    data String CODEC(ZSTD(2), LZ4HC, NONE, LZ4, LZ4)
) ENGINE = MergeTree() PARTITION BY somedate ORDER BY id SETTINGS min_index_granularity_bytes=30, write_final_mark = 0, min_bytes_for_wide_part = '10M', min_rows_for_wide_part = 0;
CREATE TABLE store_of_hash_00926 (hash UInt64) ENGINE = Memory();
SELECT COUNT(hash) FROM store_of_hash_00926;
SELECT COUNT(DISTINCT hash) FROM store_of_hash_00926;
