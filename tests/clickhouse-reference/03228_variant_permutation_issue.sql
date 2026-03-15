SET enable_json_type = 1;
CREATE TABLE test_new_json_type(id UInt32, data JSON, version UInt64) ENGINE=ReplacingMergeTree(version) ORDER BY id;
SELECT * FROM test_new_json_type FINAL WHERE data.foo2 is not null ORDER BY id;
CREATE TABLE test_new_json_type(id Nullable(UInt32), data JSON, version UInt64) ENGINE=ReplacingMergeTree(version) ORDER BY id settings allow_nullable_key=1;
SELECT * FROM test_new_json_type FINAL PREWHERE data.foo2 IS NOT NULL WHERE data.foo2 IS NOT NULL ORDER BY id ASC NULLS FIRST;
