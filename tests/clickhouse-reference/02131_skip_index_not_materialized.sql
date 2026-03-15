CREATE TABLE t_index_non_materialized (a UInt32) ENGINE = MergeTree ORDER BY tuple();
SELECT count() FROM t_index_non_materialized WHERE a = 1;
