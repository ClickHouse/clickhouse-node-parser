SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x ASC;

SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x ASC;

SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x ASC;

SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x DESC;

SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x DESC;

SELECT x
FROM (
        SELECT if(number % 5 = 0, NULL, (if(number % 3 = 0, nan, toFloat64(number)))) AS x
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY x DESC;

SELECT
    x,
    y
FROM (
        SELECT
            if(number % 5 = 0, NULL, number) AS x,
            if(number % 3 = 0, nan, toFloat64(number)) AS y
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY
    x ASC,
    y ASC;

SELECT
    x,
    y
FROM (
        SELECT
            if(number % 5 = 0, NULL, number) AS x,
            if(number % 3 = 0, nan, toFloat64(number)) AS y
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY
    x ASC,
    y ASC;

SELECT
    x,
    y
FROM (
        SELECT
            if(number % 5 = 0, NULL, number) AS x,
            if(number % 3 = 0, nan, toFloat64(number)) AS y
        FROM `system`.numbers
        LIMIT 10
    )
ORDER BY
    x DESC,
    y ASC;