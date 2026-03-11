SELECT
    number AS a,
    number + 1 AS b
FROM remote('127.0.0.{1,2}', numbers_mt(1e5))
GROUP BY GROUPING SETS ((a), (b))
FORMAT Null;