SELECT
    count(),
    _part
FROM `02581_trips`
GROUP BY _part
ORDER BY _part ASC;

SELECT
    count(),
    _part
FROM `02581_trips`
WHERE description = ''
GROUP BY _part
ORDER BY _part ASC;

SELECT count()
FROM `02581_trips`
WHERE description = '';