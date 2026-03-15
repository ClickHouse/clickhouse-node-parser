set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE test(date Date, keys Array(Nullable(UInt8))) ENGINE = MergeTree(date, date, 1);
SELECT * FROM test LIMIT 1;
SELECT avgArray(keys) FROM test;
