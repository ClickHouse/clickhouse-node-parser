SELECT *
FROM tab
ORDER BY ((a + b)) * c ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY ((a + b)) * c ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY ((a + b)) * c DESC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY ((a + b)) * c DESC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    ((a + b)) * c DESC,
    sin(a / b) DESC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            sin(a / b) DESC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    ((a + b)) * c DESC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) DESC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) DESC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    sin(a / b) ASC,
    ((a + b)) * c ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            sin(a / b) ASC,
            ((a + b)) * c ASC
    )
WHERE ilike(`explain`, '%sort description%');

SELECT *
FROM tab
WHERE ((a + b)) * c = 8
ORDER BY sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        WHERE ((a + b)) * c = 8
        ORDER BY sin(a / b) ASC
    )
WHERE ilike(`explain`, '%sort description%');

SELECT *
FROM tab
WHERE d + 1 = 2
ORDER BY
    ((d + 1)) * 4 ASC,
    ((a + b)) * c ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        WHERE d + 1 = 2
        ORDER BY
            ((d + 1)) * 4 ASC,
            ((a + b)) * c ASC
    )
WHERE ilike(`explain`, '%sort description%');

SELECT *
FROM tab
WHERE d + 1 = 3
    AND (a + b) = 4
    AND c = 2
ORDER BY
    ((d + 1)) * 4 ASC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        WHERE d + 1 = 3
            AND (a + b) = 4
            AND c = 2
        ORDER BY
            ((d + 1)) * 4 ASC,
            sin(a / b) ASC
    )
WHERE ilike(`explain`, '%sort description%');

SELECT *
FROM tab
WHERE ((a + b)) * c = 8
ORDER BY sin(b / a) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        WHERE ((a + b)) * c = 8
        ORDER BY sin(b / a) ASC
    )
WHERE ilike(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY intDiv(((a + b)) * c, 2) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY intDiv(((a + b)) * c, 2) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab
ORDER BY
    intDiv(((a + b)) * c, 2) ASC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            intDiv(((a + b)) * c, 2) ASC,
            sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c ASC,
            intDiv(sin(a / b), 2) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            intDiv(sin(a / b), 2) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c ASC,
            intDiv(sin(a / b), 2) DESC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            intDiv(sin(a / b), 2) DESC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            intDiv(sin(a / b), -2) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c DESC,
            intDiv(intDiv(sin(a / b), -2), -3) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab
        ORDER BY
            ((a + b)) * c ASC,
            intDiv(intDiv(sin(a / b), -2), -3) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        SELECT
            *,
            a + b AS x
        FROM tab
    )
ORDER BY x * c ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT
                    *,
                    a + b AS x
                FROM tab
            )
        ORDER BY x * c ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        SELECT
            *,
            a + b AS x,
            a / b AS y
        FROM tab
    )
ORDER BY
    x * c ASC,
    sin(y) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT
                    *,
                    a + b AS x,
                    a / b AS y
                FROM tab
            )
        ORDER BY
            x * c ASC,
            sin(y) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        SELECT
            *,
            a / b AS y
        FROM (
                SELECT
                    *,
                    a + b AS x
                FROM tab
            )
    )
ORDER BY
    x * c ASC,
    sin(y) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT
                    *,
                    a / b AS y
                FROM (
                        SELECT
                            *,
                            a + b AS x
                        FROM tab
                    )
            )
        ORDER BY
            x * c ASC,
            sin(y) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab2
ORDER BY
    toTimeZone(toTimezone(x, 'UTC'), 'CET') ASC,
    intDiv(intDiv(y, -2), -3) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab2
        ORDER BY
            toTimeZone(toTimezone(x, 'UTC'), 'CET') ASC,
            intDiv(intDiv(y, -2), -3) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM tab2
ORDER BY
    toStartOfDay(x) ASC,
    intDiv(intDiv(y, -2), -3) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab2
        ORDER BY
            toStartOfDay(x) ASC,
            intDiv(intDiv(y, -2), -3) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM tab2
        WHERE toTimezone(x, 'CET') = '2020-02-03 01:00:00'
        ORDER BY intDiv(intDiv(y, -2), -3) ASC
    )
WHERE like(`explain`, '%sort description%');

SELECT *
FROM (
        SELECT *
        FROM tab
        UNION ALL
        SELECT *
        FROM tab3
    )
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                UNION ALL
                SELECT *
                FROM tab3
            )
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%');

SELECT *
FROM (
        SELECT *
        FROM tab
        WHERE ((a + b)) * c = 8
        UNION ALL
        SELECT *
        FROM tab3
        WHERE ((a + b)) * c = 18
    )
ORDER BY sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                WHERE ((a + b)) * c = 8
                UNION ALL
                SELECT *
                FROM tab3
                WHERE ((a + b)) * c = 18
            )
        ORDER BY sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%');

SELECT *
FROM (
        SELECT *
        FROM tab
        WHERE ((a + b)) * c = 8
        UNION ALL
        SELECT *
        FROM tab4
    )
ORDER BY sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                WHERE ((a + b)) * c = 8
                UNION ALL
                SELECT *
                FROM tab4
            )
        ORDER BY sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%');

SELECT *
FROM (
        SELECT *
        FROM tab
        UNION ALL
        SELECT *
        FROM tab5
    )
ORDER BY ((a + b)) * c ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                UNION ALL
                SELECT *
                FROM tab5
            )
        ORDER BY ((a + b)) * c ASC
    )
WHERE like(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%');

SELECT *
FROM (
        SELECT *
        FROM tab
        UNION ALL
        SELECT *
        FROM tab5
    )
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) ASC;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                UNION ALL
                SELECT *
                FROM tab5
            )
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) ASC
    )
WHERE like(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%');

SELECT *
FROM (
        SELECT *
        FROM tab
        UNION ALL
        SELECT *
        FROM tab5
    )
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) ASC
LIMIT 3;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                UNION ALL
                SELECT *
                FROM tab5
            )
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) ASC
        LIMIT 3
    )
WHERE ilike(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%')
    OR like(`explain`, '%Limit%');

SELECT *
FROM (
        SELECT *
        FROM tab
        UNION ALL
        SELECT *
        FROM tab5
        UNION ALL
        SELECT *
        FROM tab4
    )
ORDER BY
    ((a + b)) * c ASC,
    sin(a / b) ASC,
    d ASC
LIMIT 3;

SELECT *
FROM (
        EXPLAIN PLAN actions = 1
        SELECT *
        FROM (
                SELECT *
                FROM tab
                UNION ALL
                SELECT *
                FROM tab5
                UNION ALL
                SELECT *
                FROM tab4
            )
        ORDER BY
            ((a + b)) * c ASC,
            sin(a / b) ASC,
            d ASC
        LIMIT 3
    )
WHERE ilike(`explain`, '%sort description%')
    OR like(`explain`, '%ReadType%')
    OR like(`explain`, '%Limit%');