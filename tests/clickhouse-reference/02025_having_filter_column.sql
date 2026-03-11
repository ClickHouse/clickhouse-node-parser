SELECT *
FROM (
    SELECT
        a,
        max((d, b)).2 AS value
    FROM test
    GROUP BY rollup(a)
)
WHERE a <> '';
-- the same query, but after syntax optimization
SELECT
    a,
    value
FROM
(
    SELECT
        a,
        max((d, b)).2 AS value
    FROM test
    GROUP BY a
        WITH ROLLUP
    HAVING a != ''
)
WHERE a != '';
