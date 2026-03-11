SELECT *
FROM tab
WHERE text = '1000'
SETTINGS
    use_query_condition_cache = 0,
    optimize_use_projections = 1,
    optimize_use_projection_filtering = 1;