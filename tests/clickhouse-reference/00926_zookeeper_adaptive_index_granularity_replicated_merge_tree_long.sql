-- Tags: long, replica, no-random-merge-tree-settings

----- Group of very similar simple tests ------
select '----HORIZONTAL MERGE TESTS----';
CREATE TABLE zero_rows_per_granule1 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/zero_rows_in_granule', '1') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 20, min_index_granularity_bytes = 10, write_final_mark = 0;
CREATE TABLE zero_rows_per_granule2 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/zero_rows_in_granule', '2') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 20, min_index_granularity_bytes = 10, write_final_mark = 0;
SELECT COUNT(*) FROM zero_rows_per_granule1;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM zero_rows_per_granule2;
SELECT distinct(marks) from system.parts WHERE table = 'zero_rows_per_granule2' and database=currentDatabase() and active=1;
SELECT sleep(0.7) Format Null;
CREATE TABLE four_rows_per_granule1 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/four_rows_in_granule', '1') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;
CREATE TABLE four_rows_per_granule2 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/four_rows_in_granule', '2') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100 ,write_final_mark = 0;
SELECT COUNT(*) FROM four_rows_per_granule1;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM four_rows_per_granule2;
SELECT distinct(marks) from system.parts WHERE table = 'four_rows_per_granule2' and database=currentDatabase() and active=1;
CREATE TABLE adaptive_granularity_alter1 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/adaptive_granularity_alter', '1') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;
CREATE TABLE adaptive_granularity_alter2 (
  p Date,
  k UInt64,
  v1 UInt64,
  v2 Int64
) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00926/adaptive_granularity_alter', '2') PARTITION BY toYYYYMM(p) ORDER BY k SETTINGS index_granularity_bytes = 110, min_index_granularity_bytes = 100, write_final_mark = 0;
SELECT COUNT(*) FROM adaptive_granularity_alter1;
SELECT distinct(marks) from system.parts WHERE table = 'adaptive_granularity_alter1' and database=currentDatabase() and active=1;
SELECT COUNT(*) FROM adaptive_granularity_alter2;
SELECT distinct(marks) from system.parts WHERE table = 'adaptive_granularity_alter2' and database=currentDatabase() and active=1;
SELECT k, v2 FROM adaptive_granularity_alter1 WHERE k >= 100 OR k = 42 ORDER BY k;
SELECT sum(marks) from system.parts WHERE table = 'adaptive_granularity_alter1' and database=currentDatabase() and active=1;
SELECT k, v2 FROM adaptive_granularity_alter2 WHERE k >= 100 OR k = 42 ORDER BY k;
SELECT sum(marks) from system.parts WHERE table = 'adaptive_granularity_alter2' and database=currentDatabase() and active=1;
