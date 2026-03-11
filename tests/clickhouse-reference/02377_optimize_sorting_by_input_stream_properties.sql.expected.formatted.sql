SELECT
    a,
    b
FROM optimize_sorting
ORDER BY
    a ASC,
    b ASC;

SELECT a
FROM optimize_sorting
ORDER BY a ASC;

SELECT c
FROM optimize_sorting
ORDER BY c ASC;

SELECT a
FROM optimize_sorting
ORDER BY negate(a) ASC;

SELECT a
FROM optimize_sorting
ORDER BY toFloat64(a) ASC;

SELECT
    a,
    a + 1
FROM optimize_sorting
ORDER BY a + 1 ASC;

SELECT
    a,
    a - 1
FROM optimize_sorting
ORDER BY a - 1 ASC;

SELECT
    a,
    sipHash64(a, 'a')
FROM optimize_sorting
ORDER BY sipHash64(a, 'a') ASC;

SELECT a AS a
FROM optimize_sorting
ORDER BY a ASC;

SELECT a + 1 AS a
FROM optimize_sorting
ORDER BY a ASC;

SELECT toFloat64(a) AS a
FROM optimize_sorting
ORDER BY a ASC;

SELECT sipHash64(a) AS a
FROM optimize_sorting
ORDER BY a ASC;

SELECT a
FROM optimize_sorting
WHERE a > 0
ORDER BY a ASC;

SELECT a > 0
FROM optimize_sorting
WHERE a > 0;

SELECT a
FROM (
        SELECT a
        FROM optimize_sorting
    )
WHERE a != 0
ORDER BY a ASC;

SELECT a
FROM (
        SELECT sipHash64(a) AS a
        FROM optimize_sorting
    )
WHERE a != 0
ORDER BY a ASC;

SELECT
    a,
    z
FROM (
        SELECT
            sipHash64(a) AS a,
            a + 1 AS z
        FROM (
                SELECT a
                FROM optimize_sorting
                ORDER BY a + 1 ASC
            )
    )
ORDER BY a + 1 ASC;