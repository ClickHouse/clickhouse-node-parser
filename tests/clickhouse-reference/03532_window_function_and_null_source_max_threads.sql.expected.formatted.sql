SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PIPELINE
        WITH nums AS (
            SELECT
                n1.n AS a,
                n2.n AS b
            FROM
                empty AS n1
            CROSS JOIN empty AS n2
            WHERE (n1.n % 7) = (n2.n % 5)
        ),

        window1 AS (
            SELECT
                a,
                lagInFrame(a, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lag
            FROM nums
        ),

        window2 AS (
            SELECT
                lag,
                leadInFrame(lag, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lead
            FROM window1
        )

        SELECT lead
        FROM window2
        SETTINGS
            max_threads = 20,
            enable_parallel_replicas = 0
    )
WHERE like(`explain`, '%Resize%')
LIMIT 3;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PIPELINE
        WITH nums AS (
            SELECT
                n1.n AS a,
                n2.n AS b
            FROM
                empty AS n1
            CROSS JOIN empty AS n2
            WHERE (n1.n % 7) = (n2.n % 5)
        ),

        window1 AS (
            SELECT
                a,
                lagInFrame(a, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lag
            FROM nums
        ),

        window2 AS (
            SELECT
                lag,
                leadInFrame(lag, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lead
            FROM window1
        )

        SELECT lead
        FROM window2
        SETTINGS
            max_threads = 2000,
            enable_parallel_replicas = 0
    )
WHERE like(`explain`, '%Resize%')
LIMIT 3;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN PIPELINE
        WITH nums AS (
            SELECT
                n1.n AS a,
                n2.n AS b
            FROM
                empty AS n1
            CROSS JOIN empty AS n2
            WHERE (n1.n % 7) = (n2.n % 5)
        ),

        window1 AS (
            SELECT
                a,
                lagInFrame(a, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lag
            FROM nums
        ),

        window2 AS (
            SELECT
                lag,
                leadInFrame(lag, 1, a) OVER (PARTITION BY a ORDER BY a ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS lead
            FROM window1
        )

        SELECT lead
        FROM window2
        SETTINGS
            max_threads = 300,
            enable_parallel_replicas = 0
    )
WHERE like(`explain`, '%Resize%')
LIMIT 1;