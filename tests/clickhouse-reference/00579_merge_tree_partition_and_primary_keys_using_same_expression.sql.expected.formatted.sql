CREATE TABLE partition_and_primary_keys_using_same_expression
(
    dt DateTime
)
ENGINE = MergeTree
ORDER BY toDayOfWeek(toDate(dt))
PARTITION BY toDate(dt);

SELECT *
FROM partition_and_primary_keys_using_same_expression
ORDER BY dt ASC;

SELECT '---';