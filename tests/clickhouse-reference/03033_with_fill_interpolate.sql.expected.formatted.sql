-- https://github.com/ClickHouse/ClickHouse/issues/55794
SET enable_analyzer = 1;

CREATE TABLE `03033_example_table`
(
    ColumnA Int64,
    ColumnB Int64,
    ColumnC Int64
)
ENGINE = MergeTree()
ORDER BY ColumnA;