CREATE TABLE test_max_size_drop
ENGINE = MergeTree()
ORDER BY number AS
SELECT number
FROM numbers(1000);