SELECT Name
FROM (
        SELECT DISTINCT Name
        FROM `distinct`
    )
ORDER BY Name ASC;

SELECT Num
FROM (
        SELECT DISTINCT Num
        FROM `distinct`
    )
ORDER BY Num ASC;

SELECT DISTINCT
    1 AS a,
    2 AS b
FROM `distinct`;