SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 0
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT '--';

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE users.uid = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        RIGHT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE users.uid = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        RIGHT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');