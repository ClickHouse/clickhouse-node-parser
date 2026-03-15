CREATE TABLE 03717_table
(
    id UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03717_table', '1')
ORDER BY id
SETTINGS min_bytes_for_wide_part = 10000, min_rows_for_wide_part = 10000, serialization_info_version = 'basic', string_serialization_version = 'with_size_stream';
CREATE TABLE 03717_mv_table_odd
(
    value UInt32,
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03717_mv_table_odd', '1')
ORDER BY value
SETTINGS min_bytes_for_wide_part = 10000, min_rows_for_wide_part = 10000, serialization_info_version = 'basic', string_serialization_version = 'with_size_stream';
CREATE MATERIALIZED VIEW 03717_mv_odd
TO 03717_mv_table_odd AS
SELECT count() as value FROM 03717_table where id % 2 = 1;
CREATE TABLE 03717_mv_table_even
(
    value UInt32,
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03717_mv_table_even', '1')
ORDER BY value
SETTINGS min_bytes_for_wide_part = 10000, min_rows_for_wide_part = 10000, serialization_info_version = 'basic', string_serialization_version = 'with_size_stream';
CREATE MATERIALIZED VIEW 03717_mv_even
TO 03717_mv_table_even AS
SELECT count() as value FROM 03717_table where id % 2 = 0;
CREATE TABLE 03717_mv_table_all
(
    value UInt32,
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03717_mv_table_all', '1')
ORDER BY value
SETTINGS min_bytes_for_wide_part = 10000, min_rows_for_wide_part = 10000, serialization_info_version = 'basic', string_serialization_version = 'with_size_stream';
CREATE MATERIALIZED VIEW 03717_mv_all
TO 03717_mv_table_all AS
SELECT count() as value FROM 03717_table;
SET async_insert = 1, insert_deduplicate = 1, async_insert_deduplicate = 1, wait_for_async_insert = 0, deduplicate_blocks_in_dependent_materialized_views=1;
set async_insert_use_adaptive_busy_timeout=0, async_insert_busy_timeout_min_ms=1000, async_insert_busy_timeout_max_ms=5000;
SET max_block_size=1;
SET max_insert_block_size=1;
SET min_insert_block_size_rows=0;
SET min_insert_block_size_bytes=0;
select '03717_table', * from 03717_table order by all;
select '03717_mv_table_odd', sum(value) from 03717_mv_table_odd order by all;
select '03717_mv_table_even', sum(value) from 03717_mv_table_even order by all;
select '03717_mv_table_all', sum(value) from 03717_mv_table_all order by all;
