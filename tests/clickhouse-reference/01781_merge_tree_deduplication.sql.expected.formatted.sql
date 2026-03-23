CREATE TABLE merge_tree_deduplication
(
    key UInt64,
    value String,
    part UInt8 DEFAULT 77
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY part
SETTINGS non_replicated_deduplication_window = 3;

INSERT INTO merge_tree_deduplication (key, value);

SELECT
    key,
    value
FROM merge_tree_deduplication;

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

SELECT
    key,
    value
FROM merge_tree_deduplication
ORDER BY key ASC;

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

INSERT INTO merge_tree_deduplication (key, value);

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

INSERT INTO merge_tree_deduplication (key, value, part);

SELECT
    part,
    key,
    value
FROM merge_tree_deduplication
ORDER BY
    key ASC,
    part ASC;

INSERT INTO merge_tree_deduplication (key, value, part);

INSERT INTO merge_tree_deduplication (key, value, part);

INSERT INTO merge_tree_deduplication (key, value, part);

SELECT *
FROM merge_tree_deduplication
WHERE part = 33
ORDER BY key ASC;

INSERT INTO merge_tree_deduplication (key, value, part);

INSERT INTO merge_tree_deduplication (key, value, part);

INSERT INTO merge_tree_deduplication (key, value, part);

INSERT INTO merge_tree_deduplication (key, value, part);

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
ORDER BY key;

INSERT INTO merge_tree_no_deduplication (key, value);

SELECT *
FROM merge_tree_no_deduplication
ORDER BY key ASC;

INSERT INTO merge_tree_no_deduplication (key, value);

INSERT INTO merge_tree_no_deduplication (key, value);

INSERT INTO merge_tree_no_deduplication (key, value);