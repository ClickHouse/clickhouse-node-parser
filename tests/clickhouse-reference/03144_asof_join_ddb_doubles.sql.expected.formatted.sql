SELECT
    p.ts,
    e.value
FROM
    (
        SELECT number::Float64 AS ts
        FROM numbers(10)
    ) AS p
INNER JOIN events0 AS e
    ON p.ts >= e.begin
ORDER BY p.ts ASC;

SELECT
    p.ts,
    e.value
FROM
    (
        SELECT number::Float64 AS ts
        FROM numbers(10)
    ) AS p
LEFT JOIN events0 AS e
    ON p.ts >= e.begin
ORDER BY p.ts ASC;

-- SETTINGS join_use_nulls = 1
SELECT
    p.key,
    p.ts,
    e.value
FROM
    probes AS p
INNER JOIN events AS e
    ON p.key = e.key
    AND p.ts >= e.begin
ORDER BY
    p.key ASC,
    p.ts ASC;

SELECT
    p.key,
    p.ts,
    e.value
FROM
    probes AS p
LEFT JOIN events AS e
    ON p.key = e.key
    AND p.ts >= e.begin
ORDER BY
    p.key ASC,
    p.ts ASC;