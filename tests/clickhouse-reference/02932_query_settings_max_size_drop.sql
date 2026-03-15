CREATE TABLE test_max_size_drop
Engine = MergeTree()
ORDER BY number
AS SELECT number
FROM numbers(1000)
;
