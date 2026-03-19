SELECT
    number,
    leadInFrame(number) AS W
FROM numbers(10)
LIMIT 3
WINDOW w AS (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED PRECEDING);

SELECT *
FROM ((
        SELECT
            *,
            count() OVER () AS cnt
        FROM (
                SELECT *
                FROM numbers(10000000)
            )
    ))
LIMIT 3;

SELECT *
FROM ((
        SELECT
            *,
            count() OVER () AS cnt
        FROM (
                SELECT *
                FROM numbers(10000000)
            )
    ))
ORDER BY number ASC
LIMIT 3;