SELECT a
FROM (
        SELECT
            key + 1 AS a,
            key
        FROM t1
        GROUP BY key
        HAVING key
    )
SETTINGS
    parallel_replicas_local_plan = 1,
    optimize_aggregation_in_order = 1
FORMAT Null;