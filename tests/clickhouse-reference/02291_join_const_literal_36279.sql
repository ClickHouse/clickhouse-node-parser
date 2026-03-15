SET prefer_localhost_replica = 1;
-- https://github.com/ClickHouse/ClickHouse/issues/36279
CREATE TABLE test_local (text String, text2 String) ENGINE = MergeTree() ORDER BY text;
CREATE TABLE test_distributed (text String, text2 String) ENGINE = Distributed('test_shard_localhost', currentDatabase(), test_local);
SET joined_subquery_requires_alias = 0;
SELECT COUNT() AS count
FROM test_distributed
INNER JOIN
(
    SELECT text
    FROM test_distributed
    WHERE (text ILIKE '%text-for-search%') AND (text2 ILIKE '%text-for-search%')
) USING (text)
WHERE (text ILIKE '%text-for-search%') AND (text2 ILIKE '%text-for-search%')
;
-- https://github.com/ClickHouse/ClickHouse/issues/36300
CREATE TABLE user_local ( id Int64, name String, age Int32 )
ENGINE = MergeTree ORDER BY name;
CREATE TABLE user_all ( id Int64, name String, age Int32 )
ENGINE = Distributed('test_shard_localhost', currentDatabase(), user_local, rand());
CREATE TABLE event ( id Int64, user_id Int64, content String, created_time DateTime )
ENGINE = MergeTree ORDER BY user_id;
SELECT
  u.name user_name,
  20 AS age_group
FROM user_all u
LEFT JOIN event e ON u.id = e.user_id
WHERE (u.age >= 20 AND u.age < 30)
AND e.created_time > '2022-01-01';
