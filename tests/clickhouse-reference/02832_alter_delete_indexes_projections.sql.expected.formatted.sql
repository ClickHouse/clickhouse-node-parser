SELECT count()
FROM t_delete_skip_index
WHERE y IN (4, 5);

SELECT sum(y)
FROM t_delete_projection
SETTINGS optimize_use_projections = 0;

SELECT sum(y)
FROM t_delete_projection
SETTINGS
    optimize_use_projections = 0,
    force_optimize_projection = 1;