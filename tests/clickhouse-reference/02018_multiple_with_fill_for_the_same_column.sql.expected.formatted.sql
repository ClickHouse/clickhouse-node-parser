SELECT
    x,
    y
FROM (
        SELECT
            5 AS x,
            'Hello' AS y
    )
ORDER BY
    x ASC WITH FILL FROM 3 TO 7,
    y ASC,
    x ASC WITH FILL FROM 1 TO 10; -- { serverError INVALID_WITH_FILL_EXPRESSION }