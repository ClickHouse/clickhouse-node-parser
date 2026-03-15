CREATE TABLE `01851_merge_tree`
(
    `n1` Int8,
    `n2` Int8,
    `n3` Int8,
    `n4` Int8
)
ENGINE = MergeTree
ORDER BY n1;
CREATE MATERIALIZED VIEW `01851_merge_tree_mv`
ENGINE = Memory AS
SELECT
    n2,
    n3
FROM `01851_merge_tree`;
