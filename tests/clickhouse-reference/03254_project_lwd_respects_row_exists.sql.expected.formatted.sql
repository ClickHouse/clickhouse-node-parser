SELECT
    age,
    count()
FROM users_compact
GROUP BY age
SETTINGS
    optimize_use_projections = 1,
    force_optimize_projection = 1,
    parallel_replicas_local_plan = 1,
    parallel_replicas_support_projection = 1,
    optimize_aggregation_in_order = 0;

SELECT
    age,
    count()
FROM users_wide
GROUP BY age
SETTINGS
    optimize_use_projections = 1,
    force_optimize_projection = 1,
    parallel_replicas_local_plan = 1,
    parallel_replicas_support_projection = 1,
    optimize_aggregation_in_order = 0;