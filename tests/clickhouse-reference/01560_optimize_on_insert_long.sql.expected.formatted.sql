CREATE TABLE replacing_merge_tree
(
    key UInt32,
    date Datetime
)
ENGINE = ReplacingMergeTree()
ORDER BY key
PARTITION BY date;

SELECT *
FROM replacing_merge_tree
ORDER BY key ASC;

CREATE TABLE collapsing_merge_tree
(
    key UInt32,
    sign Int8,
    date Datetime
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY key
PARTITION BY date;

SELECT *
FROM collapsing_merge_tree
ORDER BY key ASC;

CREATE TABLE versioned_collapsing_merge_tree
(
    key UInt32,
    sign Int8,
    version Int32,
    date Datetime
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY (key, version)
PARTITION BY date;

SELECT *
FROM versioned_collapsing_merge_tree
ORDER BY key ASC;

CREATE TABLE summing_merge_tree
(
    key UInt32,
    val UInt32,
    date Datetime
)
ENGINE = SummingMergeTree(val)
ORDER BY key
PARTITION BY date;

SELECT *
FROM summing_merge_tree
ORDER BY key ASC;

CREATE TABLE aggregating_merge_tree
(
    key UInt32,
    val SimpleAggregateFunction(max, UInt32),
    date Datetime
)
ENGINE = AggregatingMergeTree()
ORDER BY key
PARTITION BY date;

SELECT *
FROM aggregating_merge_tree
ORDER BY key ASC;

CREATE TABLE empty
(
    key UInt32,
    val UInt32,
    date Datetime
)
ENGINE = SummingMergeTree(val)
ORDER BY key
PARTITION BY date;

SELECT *
FROM empty
ORDER BY key ASC;

SELECT
    table,
    `partition`,
    active
FROM `system`.parts
WHERE table = 'empty'
    AND active = 1
    AND database = currentDatabase();