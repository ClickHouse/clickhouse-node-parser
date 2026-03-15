CREATE TABLE test_inserts
(
    key Int,
    part Int
)
ENGINE = MergeTree
ORDER BY key
PARTITION BY part
SETTINGS temporary_directories_lifetime = 0, merge_tree_clear_old_temporary_directories_interval_seconds = 0;

SELECT
    count(),
    sum(part)
FROM test_inserts;