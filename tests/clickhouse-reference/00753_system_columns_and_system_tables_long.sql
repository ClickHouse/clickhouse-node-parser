-- Tags: long, no-object-storage, no-random-merge-tree-settings
SET output_format_pretty_row_numbers = 0;
-- Check MergeTree declaration in new format
CREATE TABLE check_system_tables
  (
    name1 UInt8,
    name2 UInt8,
    name3 UInt8
  ) ENGINE = MergeTree()
    ORDER BY name1
    PARTITION BY name2
    SAMPLE BY name1
    SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, serialization_info_version = 'basic', auto_statistics_types = '';
SELECT name, partition_key, sorting_key, primary_key, sampling_key, storage_policy, total_rows
FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;
SELECT name, is_in_partition_key, is_in_sorting_key, is_in_primary_key, is_in_sampling_key
FROM system.columns WHERE table = 'check_system_tables' AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;
SELECT total_bytes_uncompressed, total_bytes, total_rows FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase();
-- Check VersionedCollapsingMergeTree
CREATE TABLE check_system_tables
  (
    date Date,
    value String,
    version UInt64,
    sign Int8
  ) ENGINE = VersionedCollapsingMergeTree(sign, version)
    PARTITION BY date
    ORDER BY date
    SETTINGS compress_marks=false, compress_primary_key=false, auto_statistics_types = '';
SELECT name, partition_key, sorting_key, primary_key, sampling_key
FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;
-- Check MergeTree declaration in old format
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE check_system_tables
  (
    Event Date,
    UserId UInt32,
    Counter UInt32
  ) ENGINE = MergeTree(Event, intHash32(UserId), (Counter, Event, intHash32(UserId)), 8192);
CREATE TABLE check_system_tables (key UInt8) ENGINE = TinyLog();
SELECT total_bytes, total_rows FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase();
CREATE TABLE check_system_tables (key UInt8) ENGINE = Log();
CREATE TABLE check_system_tables (key UInt8) ENGINE = StripeLog();
CREATE TABLE check_system_tables (key UInt16) ENGINE = Memory();
CREATE TABLE check_system_tables_null (key UInt16) ENGINE = Null();
CREATE TABLE check_system_tables (key UInt16) ENGINE = Buffer(
    currentDatabase(),
    check_system_tables_null,
    2,
    0,   100, /* min_time /max_time */
    100, 100, /* min_rows /max_rows */
    0,   1e6  /* min_bytes/max_bytes */
);
SELECT lifetime_bytes, lifetime_rows FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase();
CREATE TABLE check_system_tables Engine=Set() AS SELECT * FROM numbers(50);
CREATE TABLE check_system_tables Engine=Join(ANY, LEFT, number) AS SELECT * FROM numbers(50);
SELECT total_bytes BETWEEN 5000 AND 15000, total_rows FROM system.tables WHERE name = 'check_system_tables' AND database = currentDatabase();
-- Build MergeTree table for Materialized view
CREATE TABLE check_system_tables
  (
    name1 UInt8,
    name2 UInt8,
    name3 UInt8
  ) ENGINE = MergeTree()
    ORDER BY name1
    PARTITION BY name2
    SAMPLE BY name1
    SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1;
CREATE MATERIALIZED VIEW check_system_tables_mv ENGINE = MergeTree() ORDER BY name2 AS SELECT name1, name2, name3 FROM check_system_tables;
SELECT total_bytes_uncompressed, total_bytes, total_rows FROM system.tables WHERE name = 'check_system_tables_mv' AND database = currentDatabase();
SELECT total_bytes_uncompressed > 0, total_bytes > 0, total_rows FROM system.tables WHERE name = 'check_system_tables_mv' AND database = currentDatabase();
