CREATE FUNCTION test_func_1 AS (a, b, c) -> ((a + b) + c);
CREATE TABLE t4_2
(
  `col1` Int64 NOT NULL COMMENT 'test',
  `col2` Float64 NOT NULL,
  `col3` Int64 NOT NULL,
  INDEX ind4 test_func_1(col1, col3, col1) TYPE set(51) GRANULARITY 5
)
ENGINE = MergeTree
ORDER BY col1
;
SELECT * FROM t4_2 WHERE test_func_1(col1, col3, col1) = 6
SETTINGS force_data_skipping_indices = 'ind4';
