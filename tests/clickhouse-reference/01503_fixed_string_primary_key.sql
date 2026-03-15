CREATE TABLE test(key FixedString(10)) ENGINE=MergeTree() PARTITION BY tuple() ORDER BY (key);
SELECT count() FROM test WHERE key = '1';
