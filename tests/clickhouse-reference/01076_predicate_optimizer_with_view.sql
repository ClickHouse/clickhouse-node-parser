DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS test_view;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE test(date Date, id Int8, name String, value Int64) ENGINE = MergeTree(date, (id, date), 8192);
CREATE VIEW test_view AS SELECT * FROM test;
SET enable_optimize_predicate_expression = 1;
SELECT * FROM (SELECT toUInt64(b), sum(id) AS b FROM test) WHERE `toUInt64(sum(id))` = 3; -- { serverError UNKNOWN_IDENTIFIER }
