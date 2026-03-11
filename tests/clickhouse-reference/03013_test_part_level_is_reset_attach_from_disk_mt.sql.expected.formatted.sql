SELECT part_name
FROM `system`.parts
WHERE table = 'test'
    AND active
    AND database = currentDatabase();