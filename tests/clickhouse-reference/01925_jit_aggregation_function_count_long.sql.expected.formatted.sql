-- Tags: long
SET compile_aggregate_expressions = 1;

SET min_count_to_compile_aggregate_expression = 0;

CREATE TABLE test_table
(
    id UInt64,
    value UInt8,
    value_nullable Nullable(UInt8)
)
ENGINE = TinyLog;

SELECT
    id,
    count(value),
    count(value_nullable)
FROM test_table
GROUP BY id
ORDER BY id ASC;