CREATE TABLE unsorted
(
    x UInt32,
    y String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0;

SELECT *
FROM unsorted;

CREATE TABLE unsorted_replacing
(
    x UInt32,
    s String,
    v UInt32
)
ENGINE = ReplacingMergeTree(v)
ORDER BY tuple();

SELECT *
FROM unsorted_replacing FINAL;

SELECT '---';

SELECT *
FROM unsorted_replacing;

CREATE TABLE unsorted_collapsing
(
    x UInt32,
    s String,
    sign Int8
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY tuple();

SELECT *
FROM unsorted_collapsing FINAL;

SELECT *
FROM unsorted_collapsing;