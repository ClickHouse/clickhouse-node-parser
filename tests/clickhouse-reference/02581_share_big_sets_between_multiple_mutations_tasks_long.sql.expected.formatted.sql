SELECT count()
FROM `02581_trips`
WHERE description = '';

SELECT name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = '02581_trips'
    AND active
ORDER BY name ASC;

SELECT count()
FROM `02581_trips`
SETTINGS select_sequential_consistency = 1;

SELECT
    count(),
    _part
FROM `02581_trips`
WHERE description = ''
GROUP BY _part
ORDER BY _part ASC
SETTINGS select_sequential_consistency = 1;