SET joined_subquery_requires_alias = 0;

CREATE TEMPORARY TABLE test_00744
(
    x Int32
);

INSERT INTO test_00744;

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