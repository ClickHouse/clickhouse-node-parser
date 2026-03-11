SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, description = 0
        SELECT number IN (
                SELECT *
                FROM numbers(2)
            )
        FROM numbers(3)
        SETTINGS enable_join_runtime_filters = 0
    )
WHERE ilike(`explain`, '%join%');

SELECT number IN (
        SELECT *
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number IN (
        SELECT number
        FROM numbers(2)
    )
FROM numbers(3);

SELECT *
FROM numbers(3)
WHERE number IN (
        SELECT number
        FROM numbers(2)
    );

SELECT number IN (
        SELECT
            number,
            number
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number IN (
        SELECT number IN (
                SELECT *
                FROM numbers(1)
            )
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number IN (
        SELECT number
        FROM numbers(2)
        WHERE number IN (
                SELECT *
                FROM numbers(1)
            )
    )
FROM numbers(3);

SELECT number NOT IN (
        SELECT *
        FROM numbers(2)
    )
FROM numbers(3);

SELECT *
FROM numbers(3)
WHERE number NOT IN (
        SELECT number
        FROM numbers(2)
    );

SELECT number NOT IN (
        SELECT
            number,
            number
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number NOT IN (
        SELECT number IN (
                SELECT *
                FROM numbers(1)
            )
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number IN (
        SELECT number NOT IN (
                SELECT *
                FROM numbers(1)
            )
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number NOT IN (
        SELECT number NOT IN (
                SELECT *
                FROM numbers(1)
            )
        FROM numbers(2)
    )
FROM numbers(3);

SELECT number IN (
        SELECT number
        FROM numbers(2)
        WHERE number NOT IN (
                SELECT *
                FROM numbers(1)
            )
    )
FROM numbers(3);

SELECT *
FROM numbers(8)
WHERE (number+1, number+2) IN (
        SELECT
            number,
            number + 1
        FROM numbers(5)
    );

SELECT *
FROM numbers(8)
WHERE (number+1, number+2, number+3) IN (
        SELECT
            number,
            number + 1
        FROM numbers(5)
    );

SELECT if(c0 = ANY((
        SELECT 1
    )), 1, 2)
FROM (
        SELECT 1 AS c0
    ) AS tx;

SELECT if(dummy IN (
        SELECT 1
    ) AS in_expression, 11, 22)
FROM `system`.one;

SELECT if(dummy IN (
        SELECT 1
    ) AS in_expression, in_expression, 22)
FROM `system`.one;

SELECT if(dummy IN (
        SELECT 1
    ) AS in_expression, 11, in_expression)
FROM `system`.one;

SELECT if(dummy IN (
        SELECT 1
    ) AS in_expression, in_expression, in_expression)
FROM `system`.one;