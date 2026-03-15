CREATE TABLE test_lazy
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1;

SELECT
    id,
    `array`
FROM test_lazy
WHERE id = 42
ORDER BY id ASC
LIMIT 10
SETTINGS query_plan_optimize_lazy_materialization = 1;