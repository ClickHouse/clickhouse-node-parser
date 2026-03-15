CREATE TABLE test_mtree (`x` String, INDEX idx x TYPE set(10) GRANULARITY 1) ENGINE = MergeTree ORDER BY tuple();
SELECT count() FROM test_mtree WHERE x = NULL;
