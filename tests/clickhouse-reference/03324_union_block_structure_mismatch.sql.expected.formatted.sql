SELECT 1
FROM t0
WHERE materialize(1)
SETTINGS force_optimize_projection = 1;