SELECT count()
FROM sorted;

SELECT x
FROM (
        SELECT DISTINCT x
        FROM sorted
    )
ORDER BY x ASC;