SELECT s
FROM
    t
INNER JOIN (
        SELECT toUInt16(1) AS s
    ) AS x
    USING (s)
ORDER BY s ASC
SETTINGS optimize_use_projections = 1;

SELECT s
FROM
    t
INNER JOIN (
        SELECT toUInt16(1) AS s
    ) AS x
    USING (s)
ORDER BY s ASC
SETTINGS optimize_use_projections = 0;

SELECT alias1
FROM
    (
        SELECT
            id1,
            id1 AS alias1
        FROM mt
    ) AS l
INNER JOIN (
        SELECT id2 AS alias1
        FROM mt
    ) AS t
    USING (alias1)
ORDER BY l.id1 ASC
SETTINGS optimize_use_projections = 1;

SELECT id1
FROM
    mt
INNER JOIN (
        SELECT id2 AS id1
        FROM mt
    ) AS t
    USING (id1)
ORDER BY id1 ASC
SETTINGS optimize_use_projections = 1;

SELECT id2 AS id1
FROM
    mt
INNER JOIN (
        SELECT id1
        FROM mt
    ) AS t
    USING (id1)
ORDER BY id1 ASC
SETTINGS optimize_use_projections = 1;

SELECT alias1
FROM
    (
        SELECT
            id1,
            id1 AS alias1
        FROM j
    ) AS l
INNER JOIN (
        SELECT
            id2,
            id2 AS alias1
        FROM j
        WHERE id2 IN (1, 2, 3)
    ) AS t
    USING (alias1)
WHERE id2 IN (2, 3, 4)
ORDER BY id1 ASC
SETTINGS optimize_use_projections = 1;