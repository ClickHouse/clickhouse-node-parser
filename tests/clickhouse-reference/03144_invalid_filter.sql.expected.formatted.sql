-- https://github.com/ClickHouse/ClickHouse/issues/48049
SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog() AS
SELECT
    number,
    number::String
FROM numbers(10);

SYSTEM DROP  TABLE test_table;