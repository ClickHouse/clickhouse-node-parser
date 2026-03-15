CREATE TABLE group_by_pk
(
    k UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY k
PARTITION BY v % 50;

SELECT sum(v) AS s
FROM group_by_pk
GROUP BY k
ORDER BY s DESC
LIMIT 5
SETTINGS
    optimize_aggregation_in_order = 1,
    max_block_size = 1;

SELECT sum(v) AS s
FROM group_by_pk
GROUP BY k
ORDER BY s DESC
LIMIT 5
SETTINGS
    optimize_aggregation_in_order = 0,
    max_block_size = 1;