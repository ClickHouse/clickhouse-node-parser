SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 'x1'
    AND name = 'p1';

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 'x1'
    AND name = 'p2';

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 'x2'
    AND name = 'p1';

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 'x2'
    AND name = 'p2';