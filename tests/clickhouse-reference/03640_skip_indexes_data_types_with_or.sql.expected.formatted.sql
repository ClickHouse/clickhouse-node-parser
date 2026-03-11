SELECT '-- Simple OR condition';

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (i = 1
            OR s = 'firststring'
            OR u = 1
            OR hasToken(t1, 'number1'))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (id >= 301
            AND ((i = 1
            OR s = 'firststring'
            OR u = 1
            OR hasToken(t1, 'number1'))))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (i = 10
            OR s = 'laststring')
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (hasToken(t1, 'number1')
            OR hasToken(t2, 'line1'))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (hasToken(t1, 'number1')
            OR hasToken(t2, 'line85'))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');