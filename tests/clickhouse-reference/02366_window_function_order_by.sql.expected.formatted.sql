SELECT groupArray(tuple(value)) OVER ()
FROM (
        SELECT number AS value
        FROM numbers(10)
    )
ORDER BY value ASC;

SELECT count() OVER (ORDER BY number + 1 ASC)
FROM numbers(10)
ORDER BY number ASC;

SELECT count() OVER (ORDER BY number + 1 ASC) + 1 AS foo
FROM numbers(10)
ORDER BY foo ASC;