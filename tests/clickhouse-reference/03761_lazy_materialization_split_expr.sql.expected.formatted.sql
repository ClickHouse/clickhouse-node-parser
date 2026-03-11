SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM (
                SELECT
                    sin(x) + y AS a,
                    sin(x) - z AS b
                FROM tab
            )
        ORDER BY b ASC
        LIMIT 10
        SETTINGS
            query_plan_max_limit_for_lazy_materialization = 0,
            query_plan_execute_functions_after_sorting = 0
    )
WHERE like(`explain`, '%Lazily read columns%');