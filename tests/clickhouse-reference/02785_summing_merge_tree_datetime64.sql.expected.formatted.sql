CREATE TABLE summing_merge_tree_datetime64
(
    pk UInt64,
    timestamp DateTime64(3),
    value UInt64
)
ENGINE = SummingMergeTree()
ORDER BY pk;

SELECT *
FROM summing_merge_tree_datetime64 FINAL;