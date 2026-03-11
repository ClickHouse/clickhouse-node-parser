SELECT
    x,
    negate(x),
    y
FROM (
        SELECT
            5 AS x,
            'Hello' AS y
    )
ORDER BY
    x ASC WITH FILL FROM 3 TO 7,
    y ASC,
    negate(x) ASC WITH FILL FROM -10 TO -1;