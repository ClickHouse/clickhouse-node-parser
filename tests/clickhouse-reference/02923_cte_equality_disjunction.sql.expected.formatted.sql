--https://github.com/ClickHouse/ClickHouse/issues/5323
CREATE TABLE test_bug_optimization
(
    path String
)
ENGINE = MergeTree
ORDER BY path;