SET join_algorithm = 'partial_merge';

SELECT
    s1.x,
    s2.x
FROM
    (
        SELECT 1 AS x
    ) AS s1
LEFT JOIN (
        SELECT 1 AS x
    ) AS s2
    USING (x);

SELECT *
FROM
    (
        SELECT materialize(2) AS x
    ) AS s1
LEFT JOIN (
        SELECT 2 AS x
    ) AS s2
    USING (x);

SELECT *
FROM
    (
        SELECT 3 AS x
    ) AS s1
LEFT JOIN (
        SELECT materialize(3) AS x
    ) AS s2
    USING (x);

SELECT *
FROM
    (
        SELECT toLowCardinality(4) AS x
    ) AS s1
LEFT JOIN (
        SELECT 4 AS x
    ) AS s2
    USING (x);

SELECT *
FROM
    (
        SELECT 5 AS x
    ) AS s1
LEFT JOIN (
        SELECT toLowCardinality(5) AS x
    ) AS s2
    USING (x);

SET join_algorithm = 'full_sorting_merge';

SET join_algorithm = 'grace_hash';