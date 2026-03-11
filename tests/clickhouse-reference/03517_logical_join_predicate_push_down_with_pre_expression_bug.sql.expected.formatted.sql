SELECT td_d
FROM (
        SELECT
            t.id AS td_id,
            t.d AS td_d,
            uniqExact(tdt.id) AS cnt
        FROM
            td AS t
        LEFT JOIN tdt
            ON toDate(tdt.dt) = t.d
        GROUP BY
            td_id,
            td_d
    )
WHERE td_d = '2025-04-01';

SELECT td_d
FROM (
        SELECT
            t.id AS td_id,
            t.d AS td_d,
            uniqExact(tdt.id) AS cnt
        FROM
            tdt
        RIGHT JOIN td AS t
            ON toDate(tdt.dt) = t.d
        GROUP BY
            td_id,
            td_d
    )
WHERE td_d = '2025-04-01';

SELECT td_d
FROM (
        SELECT
            t.id AS td_id,
            t.d AS td_d,
            uniqExact(tdt.id) AS cnt
        FROM
            td AS t
        INNER JOIN tdt
            ON toDate(tdt.dt) = t.d
        GROUP BY
            td_id,
            td_d
    )
WHERE td_d = '2025-04-01';

SELECT td_d
FROM (
        SELECT
            t.id AS td_id,
            t.d AS td_d,
            uniqExact(tdt.id) AS cnt
        FROM
            tdt
        INNER JOIN td AS t
            ON toDate(tdt.dt) = t.d
        GROUP BY
            td_id,
            td_d
    )
WHERE td_d = '2025-04-01';

SELECT td_d
FROM v
WHERE td_d = '2025-04-01';