SELECT
    number AS a,
    number * 2 AS b
FROM numbers(3)
FORMAT JSONEachRow;

SELECT *
FROM numbers(1)
FORMAT JSONEachRow;

SELECT *
FROM numbers(1)
WHERE NULL
FORMAT JSONEachRow;