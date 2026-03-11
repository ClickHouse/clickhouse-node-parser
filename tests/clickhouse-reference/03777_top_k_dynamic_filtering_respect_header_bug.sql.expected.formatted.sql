SELECT
    a,
    b,
    c
FROM logs
WHERE a > 0
ORDER BY c DESC
LIMIT 1
SETTINGS
    use_top_k_dynamic_filtering = true,
    query_plan_max_limit_for_top_k_optimization = 1,
    query_plan_optimize_lazy_materialization = 1,
    query_plan_max_limit_for_lazy_materialization = 100;