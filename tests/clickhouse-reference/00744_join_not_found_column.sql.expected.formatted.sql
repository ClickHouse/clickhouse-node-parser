SELECT x
FROM (
        SELECT
            x,
            `1`
        FROM
            (
                SELECT
                    x,
                    1
                FROM test_00744
            )
        INNER JOIN (
                SELECT
                    count(),
                    1
                FROM test_00744
            ) AS jss2
            USING (`1`)
        LIMIT 10
    );

SELECT
    x,
    `1`
FROM
    (
        SELECT
            x,
            1
        FROM test_00744
    )
INNER JOIN (
        SELECT
            count(),
            1
        FROM test_00744
    ) AS js2
    USING (`1`)
LIMIT 10;