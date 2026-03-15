CREATE TABLE t_primary_index_memory (s String) ENGINE = MergeTree
ORDER BY s SETTINGS index_granularity = 1;
SELECT count() FROM t_primary_index_memory;
