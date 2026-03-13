SELECT *
FROM
    Alpha
FULL JOIN (
        SELECT 'b' AS foo
    ) AS js2
    USING (foo)
ORDER BY foo ASC;

SELECT *
FROM
    Alpha
FULL JOIN Beta
    USING (foo)
ORDER BY foo ASC;

SELECT *
FROM
    Alpha
FULL JOIN Beta
    ON Alpha.foo = Beta.foo
ORDER BY foo ASC;

-- https://github.com/ClickHouse/ClickHouse/issues/20315#issuecomment-789579457
SELECT materialize(js2.k)
FROM
    (
        SELECT toLowCardinality(number) AS k
        FROM numbers(1)
    ) AS js1
FULL JOIN (
        SELECT number + 7 AS k
        FROM numbers(1)
    ) AS js2
    USING (k)
ORDER BY js2.k ASC;