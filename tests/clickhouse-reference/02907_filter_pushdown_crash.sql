CREATE TABLE t1 (key UInt8) ENGINE = MergeTree ORDER BY key;
CREATE TABLE t2 (key UInt32) ENGINE = MergeTree ORDER BY key;
SELECT a FROM ( SELECT key + 1 as a, key FROM t1 GROUP BY key ) WHERE key FORMAT Null;
SET join_algorithm = 'full_sorting_merge';
SET max_rows_in_set_to_optimize_join = 0;
SELECT key FROM ( SELECT key FROM t1 GROUP BY key ) t1 JOIN (SELECT key FROM t2) t2 ON t1.key = t2.key WHERE key FORMAT Null;
