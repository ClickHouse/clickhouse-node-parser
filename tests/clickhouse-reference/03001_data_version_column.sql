CREATE TABLE t_data_version (a UInt64, b UInt64) ENGINE = MergeTree ORDER BY a;
SELECT _part, _part_data_version, * FROM t_data_version ORDER BY a;
-- Check parts pruning.
SELECT _part, _part_data_version, * FROM t_data_version WHERE _part_data_version = 4 ORDER BY a SETTINGS max_rows_to_read = 1;
