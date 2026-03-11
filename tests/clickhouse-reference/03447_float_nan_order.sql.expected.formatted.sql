SELECT '--- short array ASC NULLS FIRST';

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY a ASC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY a ASC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY a DESC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY a DESC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY a ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY a ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY a DESC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY a DESC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY
    a ASC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY
    a ASC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY
    a DESC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(3)
ORDER BY
    a DESC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY
    a ASC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY
    a ASC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY
    a DESC,
    1 ASC;

SELECT number + number / number AS a
FROM numbers(256)
ORDER BY
    a DESC,
    1 ASC;