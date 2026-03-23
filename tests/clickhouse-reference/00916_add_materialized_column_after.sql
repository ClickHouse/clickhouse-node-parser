DROP TABLE IF EXISTS add_materialized_column_after;
CREATE TABLE add_materialized_column_after (x UInt32, z UInt64) ENGINE MergeTree ORDER BY x;
DROP TABLE add_materialized_column_after;
