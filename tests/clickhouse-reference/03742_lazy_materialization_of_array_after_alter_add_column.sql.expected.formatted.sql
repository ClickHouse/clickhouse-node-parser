SELECT
    id,
    `array`
FROM test_lazy
WHERE id = 42
ORDER BY id ASC
LIMIT 10
SETTINGS query_plan_optimize_lazy_materialization = 1;