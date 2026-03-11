SELECT
    min_time,
    max_time
FROM `system`.parts
WHERE table = 'test'
    AND database = currentDatabase();

SELECT
    min_time,
    max_time
FROM `system`.parts_columns
WHERE table = 'test'
    AND database = currentDatabase();