SELECT
    type,
    sum(eventcnt)
FROM tp
GROUP BY type
ORDER BY type ASC
SETTINGS
    optimize_use_projections = 0,
    force_optimize_projection = 0;

SELECT
    type,
    sum(eventcnt)
FROM tp
GROUP BY type
ORDER BY type ASC
SETTINGS
    optimize_use_projections = 1,
    force_optimize_projection = 1;