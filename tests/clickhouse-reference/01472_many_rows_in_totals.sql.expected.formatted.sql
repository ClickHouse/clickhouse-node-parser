SELECT
    g,
    s
FROM
    (
        SELECT
            g,
            sum(number) AS s
        FROM numbers(4)
        GROUP BY bitAnd(number, 1) AS g
        WITH TOTALS
        ORDER BY g ASC
    )
ARRAY JOIN [1, 2] AS a
FORMAT Pretty;

SELECT '--';

SELECT
    g,
    s
FROM
    (
        SELECT
            g,
            sum(number) AS s
        FROM numbers(4)
        GROUP BY bitAnd(number, 1) AS g
        WITH TOTALS
        ORDER BY g ASC
    )
ARRAY JOIN [1, 2] AS a
FORMAT TSV;

SELECT
    g,
    s
FROM
    (
        SELECT
            g,
            sum(number) AS s
        FROM numbers(4)
        GROUP BY bitAnd(number, 1) AS g
        WITH TOTALS
        ORDER BY g ASC
    )
ARRAY JOIN [1, 2] AS a
FORMAT JSON;