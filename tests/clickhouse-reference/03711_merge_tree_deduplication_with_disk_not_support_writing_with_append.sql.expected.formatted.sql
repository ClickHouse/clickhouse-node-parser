-- Tags: long, no-replicated-database, no-fasttest
-- Tag no-replicated-database: Unsupported type of ALTER query
-- Suppress error logs because `temporary_directories_lifetime` is 1 seconds (the default value is 1 day).
-- And when a part is duplicated, it will be removed. However, because `temporary_directories_lifetime` is 1 seconds (the default value is 1 day), 
-- it might be removed by `MergeTreeData::clearOldTemporaryDirectories` thread.
-- `IMergeTreeDataPart::removeIfNeeded` will fail to remove the part, causing it to have some error logs.
SET send_logs_level = 'fatal';

CREATE TABLE merge_tree_deduplication
(
    key UInt64,
    value String,
    part UInt8 DEFAULT 77
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY part
SETTINGS non_replicated_deduplication_window = 3, disk = 's3_plain_rewritable';

SELECT
    key,
    value
FROM merge_tree_deduplication;

SELECT
    key,
    value
FROM merge_tree_deduplication
ORDER BY key ASC;

SELECT
    key,
    value
FROM merge_tree_deduplication
WHERE key = 10;

SELECT
    key,
    value
FROM merge_tree_deduplication
WHERE key = 12;

SELECT
    part,
    key,
    value
FROM merge_tree_deduplication
ORDER BY
    key ASC,
    part ASC;

SELECT *
FROM merge_tree_deduplication
WHERE part = 33
ORDER BY key ASC;

SELECT *
FROM merge_tree_deduplication
WHERE part = 44
ORDER BY key ASC;

CREATE TABLE merge_tree_no_deduplication
(
    key UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS disk = 's3_plain_rewritable';

SELECT *
FROM merge_tree_no_deduplication
ORDER BY key ASC;