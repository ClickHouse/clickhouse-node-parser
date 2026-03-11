SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin >= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    USING (begin)
ORDER BY p.begin ASC
SETTINGS join_use_nulls = 0;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin >= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    USING (begin)
ORDER BY p.begin ASC
SETTINGS join_use_nulls = 0;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
RIGHT JOIN events0 AS e
    ON p.begin >= e.begin
ORDER BY e.begin ASC;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
RIGHT JOIN events0 AS e
    USING (begin)
ORDER BY e.begin ASC;

SELECT
    p.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN (
        SELECT *
        FROM events0
        WHERE log(value + 5) > 10
    ) AS e
    ON p.begin + toIntervalHour(2) >= e.begin + toIntervalHour(1)
ORDER BY p.begin ASC;