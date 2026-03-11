SELECT
    name,
    uid
FROM users
ORDER BY age ASC
SETTINGS optimize_use_projections = 1, force_optimize_projection = 1;
