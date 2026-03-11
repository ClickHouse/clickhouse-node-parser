SELECT part_name
FROM `system`.parts
WHERE table = 't0'
    AND database = currentDatabase();

SELECT c0
FROM t0;