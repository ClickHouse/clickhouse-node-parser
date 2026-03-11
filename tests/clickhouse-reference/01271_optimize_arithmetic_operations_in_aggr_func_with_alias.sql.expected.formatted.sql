SELECT min(((n AS a)) + ((1 AS b))) AS c
FROM (
        SELECT number AS n
        FROM numbers(10)
    )
WHERE a > 0
    AND b > 0
HAVING c > 0;

SELECT min((n + 1) AS a) AS c
FROM (
        SELECT number AS n
        FROM numbers(10)
    )
WHERE a > 0
HAVING c > 0;

SELECT min(n + 1) AS c
FROM (
        SELECT number AS n
        FROM numbers(10)
    )
HAVING c > 0;