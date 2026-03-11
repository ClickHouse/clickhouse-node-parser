SELECT sum(key)
FROM projection_without_key
SETTINGS optimize_use_projections = 1;

SELECT sum(key)
FROM projection_without_key
SETTINGS optimize_use_projections = 0;