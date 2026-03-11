SELECT *
FROM data
PREWHERE indexHint(_partition_id = '1');

SELECT count()
FROM data
PREWHERE indexHint(_partition_id = '1')
SETTINGS optimize_use_implicit_projections = 0;

SELECT *
FROM data
WHERE indexHint(_partition_id = '1');

SELECT count()
FROM data
WHERE indexHint(_partition_id = '1')
SETTINGS optimize_use_implicit_projections = 0;