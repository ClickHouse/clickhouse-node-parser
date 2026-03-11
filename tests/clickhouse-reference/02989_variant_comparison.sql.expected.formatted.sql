SELECT v1
FROM test
ORDER BY v1 ASC;

SELECT v1
FROM test
ORDER BY v1 ASC;

SELECT v2
FROM test
ORDER BY v2 ASC;

SELECT v2
FROM test
ORDER BY v2 ASC;

SELECT *
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT *
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT *
FROM test
ORDER BY
    v2 ASC,
    v1 ASC;

SELECT *
FROM test
ORDER BY
    v2 ASC,
    v1 ASC;

SELECT
    v1,
    v2,
    v1 = v2
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT
    v1,
    v2,
    v1 < v2
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT
    v1,
    v2,
    v1 <= v2
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT
    v1,
    v2,
    v1 > v2
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;

SELECT
    v1,
    v2,
    v2 >= v2
FROM test
ORDER BY
    v1 ASC,
    v2 ASC;