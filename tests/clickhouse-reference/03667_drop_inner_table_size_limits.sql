CREATE TABLE t (id UInt64) ENGINE = MergeTree ORDER BY id;
CREATE MATERIALIZED VIEW mv (id UInt64) ENGINE = MergeTree ORDER BY id AS SELECT id FROM t;
SET max_table_size_to_drop = 1, max_partition_size_to_drop = 1;
SET max_table_size_to_drop = 0, max_partition_size_to_drop = 0;
