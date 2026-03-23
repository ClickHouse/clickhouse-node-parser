DROP TABLE IF EXISTS merge_tree;

CREATE TABLE merge_tree
(
    d Date
)
ENGINE = MergeTree
ORDER BY d
PARTITION BY d;

INSERT INTO merge_tree;

SELECT
    1,
    *
FROM merge_tree
ORDER BY d ASC;

SELECT
    3,
    *
FROM merge_tree
ORDER BY d ASC;

SELECT
    4,
    *
FROM merge_tree
ORDER BY d ASC;

SELECT
    5,
    *
FROM merge_tree
ORDER BY d ASC;

SELECT
    6,
    *
FROM merge_tree
ORDER BY d ASC;

DROP TABLE merge_tree;