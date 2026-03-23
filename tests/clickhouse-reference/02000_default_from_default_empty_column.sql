DROP TABLE IF EXISTS test;
CREATE TABLE test (col Int8) ENGINE=MergeTree ORDER BY tuple()
SETTINGS vertical_merge_algorithm_min_rows_to_activate=1,
         vertical_merge_algorithm_min_columns_to_activate=1,
         min_bytes_for_wide_part = 0;
INSERT INTO test VALUES (1);
SELECT * FROM test;
