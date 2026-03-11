SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        WHERE t1.a = t2.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        WHERE t1.b = t2.b
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        WHERE t1.a = t2.a
            AND t1.a = t3.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        WHERE t1.b = t2.b
            AND t1.b = t3.b
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.a = t2.a
            AND t1.a = t3.a
            AND t1.a = t4.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.b = t2.b
            AND t1.b = t3.b
            AND t1.b = t4.b
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t2.a = t1.a
            AND t2.a = t3.a
            AND t2.a = t4.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t3.a = t1.a
            AND t3.a = t2.a
            AND t3.a = t4.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t4.a = t1.a
            AND t4.a = t2.a
            AND t4.a = t3.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.a = t2.a
            AND t2.a = t3.a
            AND t3.a = t4.a
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        INNER JOIN t2
            USING (a)
        CROSS JOIN t3
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN SYNTAX
        SELECT t1.a
        FROM
            t1
        INNER JOIN t2
            ON t1.a = t2.a
        CROSS JOIN t3
    );

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        WHERE t1.a = t2.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        WHERE t1.b = t2.b
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        WHERE t1.a = t2.a
            AND t1.a = t3.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        WHERE t1.b = t2.b
            AND t1.b = t3.b
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.a = t2.a
            AND t1.a = t3.a
            AND t1.a = t4.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.b = t2.b
            AND t1.b = t3.b
            AND t1.b = t4.b
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t2.a = t1.a
            AND t2.a = t3.a
            AND t2.a = t4.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t3.a = t1.a
            AND t3.a = t2.a
            AND t3.a = t4.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t4.a = t1.a
            AND t4.a = t2.a
            AND t4.a = t3.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
        WHERE t1.a = t2.a
            AND t2.a = t3.a
            AND t3.a = t4.a
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
        CROSS JOIN t4
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        CROSS JOIN t2
        CROSS JOIN t3
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        INNER JOIN t2
            USING (a)
        CROSS JOIN t3
    )
SETTINGS enable_analyzer = 1;

SELECT
    countIf(like(`explain`, '%COMMA%')
    OR like(`explain`, '%CROSS%')),
    countIf(like(`explain`, '%INNER%'))
FROM (
        EXPLAIN QUERY TREE
        SELECT t1.a
        FROM
            t1
        INNER JOIN t2
            ON t1.a = t2.a
        CROSS JOIN t3
    )
SETTINGS enable_analyzer = 1;

SELECT *
FROM
    t1
CROSS JOIN t2
ORDER BY
    t1.a ASC,
    t2.b ASC;

SELECT *
FROM
    t1
CROSS JOIN t2
WHERE t1.a = t2.a
ORDER BY
    t1.a ASC,
    t2.b ASC;

SELECT
    t1.a,
    t2.b
FROM
    t1
CROSS JOIN t2
WHERE t1.b = t2.b;

SELECT
    t1.a,
    t2.b,
    t3.b
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
WHERE t1.a = t2.a
    AND t1.a = t3.a
ORDER BY
    t2.b ASC,
    t3.b ASC;

SELECT
    t1.a,
    t2.b,
    t3.b
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
WHERE t1.b = t2.b
    AND t1.b = t3.b;

SELECT
    t1.a,
    t2.b,
    t3.b,
    t4.b
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
WHERE t1.a = t2.a
    AND t1.a = t3.a
    AND t1.a = t4.a
ORDER BY
    t2.b ASC,
    t3.b ASC,
    t4.b ASC;

SELECT
    t1.a,
    t2.b,
    t3.b,
    t4.b
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
WHERE t1.b = t2.b
    AND t1.b = t3.b
    AND t1.b = t4.b;

SELECT
    t1.a,
    t2.b,
    t3.b,
    t4.b
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
WHERE t1.a = t2.a
    AND t2.a = t3.a
    AND t3.a = t4.a
ORDER BY
    t2.b ASC,
    t3.b ASC,
    t4.b ASC;