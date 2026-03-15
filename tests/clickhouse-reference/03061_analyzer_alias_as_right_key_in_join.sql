-- https://github.com/ClickHouse/ClickHouse/issues/24395
SET enable_analyzer=1;
CREATE TABLE xxxx_yyy (key UInt32, key_b ALIAS key) ENGINE=MergeTree() ORDER BY key;
SELECT *
FROM xxxx_yyy AS a
INNER JOIN xxxx_yyy AS b ON a.key = b.key_b
ORDER BY ALL;
