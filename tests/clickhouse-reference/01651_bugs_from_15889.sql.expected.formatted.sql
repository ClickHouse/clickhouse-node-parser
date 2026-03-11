SELECT count(7 = (
        SELECT number
        FROM numbers(0)
        ORDER BY number ASC
        LIMIT 7
    ))
FROM xp_d
PREWHERE toYYYYMM(A) GLOBAL IN (
        SELECT
            NULL = (
                SELECT number
                FROM numbers(1)
                ORDER BY number DESC
                LIMIT 1
            ),
            toYYYYMM(min(A))
        FROM xp_d
    )
WHERE B > NULL
FORMAT Null;

SELECT count()
FROM xp_d
WHERE A GLOBAL IN (
        SELECT NULL
    );

SELECT
    number,
    number / 2 AS n,
    j1,
    j2
FROM
    remote('127.0.0.{2,3}', `system`.numbers)
LEFT JOIN (
        SELECT
            number / 3 AS n,
            number AS j1,
            'Hello' AS j2
        FROM `system`.numbers
        LIMIT 1048577
    )
    USING (n)
LIMIT 10
FORMAT Null;