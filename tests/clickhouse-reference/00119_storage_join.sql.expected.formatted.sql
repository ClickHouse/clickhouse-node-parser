SELECT
    k,
    s
FROM
    (
        SELECT number AS k
        FROM `system`.numbers
        LIMIT 10
    ) AS js1
LEFT JOIN t2
    USING (k);

SELECT
    s,
    x
FROM
    (
        SELECT number AS k
        FROM `system`.numbers
        LIMIT 10
    ) AS js1
LEFT JOIN t2
    USING (k);

SELECT
    x,
    s,
    k
FROM
    (
        SELECT number AS k
        FROM `system`.numbers
        LIMIT 10
    ) AS js1
LEFT JOIN t2
    USING (k);

SELECT
    1,
    x,
    2,
    s,
    3,
    k,
    4
FROM
    (
        SELECT number AS k
        FROM `system`.numbers
        LIMIT 10
    ) AS js1
LEFT JOIN t2
    USING (k);

SELECT
    t1.k,
    t1.s,
    t2.x
FROM
    (
        SELECT
            number AS k,
            'a' AS s
        FROM numbers(2)
        GROUP BY number
        WITH TOTALS
        ORDER BY number ASC
    ) AS t1
LEFT JOIN t2 AS t2
    USING (k);