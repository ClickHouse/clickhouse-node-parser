SELECT '-- Simple OR condition';

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (v1 = 111
            OR v2 = 111)
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (id >= 5000
            AND ((v1 = 111
            OR v2 = 111)))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (_part_offset >= 5000
            AND ((v1 = 111
            OR v2 = 111)))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE v1 = 111
            OR v2 = 111
            OR v3 = 90000
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE (and(greaterOrEquals(v1, 10), lessOrEquals(v1, 20))
            AND and(greaterOrEquals(v2, 10), lessOrEquals(v2, 20)))
            OR (and(greaterOrEquals(v1, 100), lessOrEquals(v1, 2000))
            AND and(greaterOrEquals(v2, 100), lessOrEquals(v2, 2000)))
            OR (v1 > 9000
            AND v2 > 9000)
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');

SELECT count(*)
FROM tab
WHERE (v1 = 1
    AND v2 = 10000)
    OR (v1 = 129
    AND v2 = 9872)
    OR ((v1 = 999
    OR v2 = 9002))
    OR (v1 = 1300
    AND v2 = 8701)
    OR (v1 = 5000
    AND v2 = 5001)
    OR (v1 = 9000
    AND v2 = 1001)
SETTINGS max_rows_to_read = 384;

SELECT `explain` AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT
            x,
            y,
            v1,
            v2
        FROM tab
        WHERE ((x < 100
            AND y < 20))
            AND ((v1 = 111
            OR v2 = 111))
    )
WHERE like(`explain`, '%Granules%')
    OR like(`explain`, '%PrimaryKey%')
    OR like(`explain`, '%Name%');