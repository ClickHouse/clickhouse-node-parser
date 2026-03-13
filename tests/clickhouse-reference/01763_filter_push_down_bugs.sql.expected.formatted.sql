SELECT *
FROM (
        SELECT
            col1,
            col2
        FROM (
                SELECT
                    '1' AS col1,
                    '2' AS col2
            )
        GROUP BY
            col1,
            col2
    ) AS expr_qry
WHERE col2 != '';

SELECT *
FROM (
        SELECT
            materialize('1') AS s1,
            materialize('2') AS s2
        GROUP BY
            s1,
            s2
    )
WHERE s2 = '2';

SELECT *
FROM (
        SELECT
            materialize([1]) AS s1,
            materialize('2') AS s2
        GROUP BY
            s1,
            s2
    )
WHERE s2 = '2';

SELECT *
FROM (
        SELECT
            materialize([[1]]) AS s1,
            materialize('2') AS s2
        GROUP BY
            s1,
            s2
    )
WHERE s2 = '2';

SELECT *
FROM (
        SELECT
            String1,
            String2,
            String3,
            String4,
            COUNT(*)
        FROM Test
        GROUP BY
            String1,
            String2,
            String3,
            String4
    ) AS expr_qry;

SELECT *
FROM (
        SELECT
            String1,
            String2,
            String3,
            String4,
            COUNT(*)
        FROM Test
        GROUP BY
            String1,
            String2,
            String3,
            String4
    ) AS expr_qry
WHERE String4 = 'String4_0';

SELECT
    x,
    y
FROM
    (
        SELECT
            [0, 1, 2] AS y,
            1 AS a,
            2 AS b
    )
ARRAY JOIN y AS x
WHERE a = 1
    AND b = 2
    AND ((x = 1
    OR x != 1))
    AND x = 1;

SELECT a
FROM
    t AS t1
INNER JOIN t AS t2
    ON t1.a = t2.a
WHERE t1.a;

-- expected to get row (1, 3, 1, 4) from JOIN and empty result from the query
SELECT *
FROM
    (
        SELECT *
        FROM Values('id UInt64, t UInt64', (1, 3))
    ) AS t1
INNER JOIN (
        SELECT *
        FROM Values('id UInt64, t UInt64', (1, 1), (1, 2), (1, 3), (1, 4), (1, 5))
    ) AS t2
    ON (t1.id = t2.id)
    AND (t1.t < t2.t)
WHERE t2.t != 4;