SELECT *
FROM `system`.projections
WHERE database = currentDatabase();

SELECT count(*)
FROM `system`.projections
WHERE table = 'projections'
    AND database = currentDatabase();

SELECT count(*)
FROM `system`.projections
WHERE table = 'projections_2'
    AND database = currentDatabase();

SELECT name
FROM `system`.projections
WHERE type = 'Normal'
    AND database = currentDatabase();