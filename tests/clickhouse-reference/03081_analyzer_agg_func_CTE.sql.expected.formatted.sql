-- https://github.com/ClickHouse/ClickHouse/issues/36189
SET enable_analyzer = 1;

CREATE TABLE test
(
    dt Date,
    text String
)
ENGINE = MergeTree
ORDER BY dt;