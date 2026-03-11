SELECT s
FROM (
        SELECT
            5 AS x,
            'Hello' AS s
        ORDER BY x ASC WITH FILL FROM 1 TO 10
    )
ORDER BY s ASC;