CREATE TABLE summing_merge_tree_datetime64
(
    pk UInt64,
    timestamp DateTime64(3),
    value UInt64
)
ENGINE = SummingMergeTree()
ORDER BY pk;

INSERT INTO summing_merge_tree_datetime64 SELECT
    1 AS pk,
    '2023-05-01 23:55:55.100' AS timestamp,
    1 AS value;

INSERT INTO summing_merge_tree_datetime64 SELECT
    1 AS pk,
    '2023-05-01 23:55:55.100' AS timestamp,
    2 AS value;

INSERT INTO summing_merge_tree_datetime64 SELECT
    1 AS pk,
    '2023-05-01 23:55:55.100' AS timestamp,
    3 AS value;

INSERT INTO summing_merge_tree_datetime64 SELECT
    1 AS pk,
    '2023-05-01 23:55:55.100' AS timestamp,
    4 AS value;

INSERT INTO summing_merge_tree_datetime64 SELECT
    1 AS pk,
    '2023-05-01 23:55:55.100' AS timestamp,
    5 AS value;

SELECT *
FROM summing_merge_tree_datetime64 FINAL;