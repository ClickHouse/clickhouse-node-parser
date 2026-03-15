CREATE TABLE partition_and_primary_keys_using_same_expression(dt DateTime)
    ENGINE MergeTree PARTITION BY toDate(dt) ORDER BY toDayOfWeek(toDate(dt));
SELECT * FROM partition_and_primary_keys_using_same_expression ORDER BY dt;
SELECT '---';
