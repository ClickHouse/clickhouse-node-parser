CREATE TABLE merge_tree_deduplication
(
    key UInt64,
    value String,
    part UInt8 DEFAULT 77
)
ENGINE=MergeTree()
ORDER BY key
PARTITION BY part
SETTINGS non_replicated_deduplication_window=3;
SELECT key, value FROM merge_tree_deduplication;
SELECT key, value FROM merge_tree_deduplication ORDER BY key;
SELECT key, value FROM merge_tree_deduplication WHERE key = 10;
SELECT key, value FROM merge_tree_deduplication WHERE key = 12;
SELECT part, key, value FROM merge_tree_deduplication ORDER BY key, part;
SELECT * FROM merge_tree_deduplication WHERE part = 33 ORDER BY key;
SELECT * FROM merge_tree_deduplication WHERE part = 44 ORDER BY key;
CREATE TABLE merge_tree_no_deduplication
(
    key UInt64,
    value String
)
ENGINE=MergeTree()
ORDER BY key;
SELECT * FROM merge_tree_no_deduplication ORDER BY key;
