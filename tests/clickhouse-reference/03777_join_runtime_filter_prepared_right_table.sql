SET enable_parallel_replicas = 0;
SET enable_analyzer = 1;
CREATE TABLE t1 (key1 UInt64, key2 UInt64, key3 UInt64) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE tj (key2 UInt64, key1 UInt64, key3 UInt64, attr UInt64) ENGINE = Join(ALL, INNER, key3, key2, key1);
SET enable_join_runtime_filters = 0;
SELECT * FROM t1 ALL INNER JOIN tj USING (key1, key2, key3) ORDER BY key1;
SET enable_join_runtime_filters = 1;
