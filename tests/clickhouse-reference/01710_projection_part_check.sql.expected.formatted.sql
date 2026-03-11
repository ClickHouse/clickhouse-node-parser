SELECT part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tp';

SELECT part_type
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table = 'tp';