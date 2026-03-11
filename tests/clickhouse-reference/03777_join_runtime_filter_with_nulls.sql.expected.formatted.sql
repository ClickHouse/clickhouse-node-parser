SELECT
    id,
    value
FROM
    (
        SELECT
            materialize(toLowCardinality(toNullable(0))) AS id,
            1 AS value
    ) AS a
INNER JOIN (
        SELECT toLowCardinality(0) AS id
    ) AS d
    USING (id);

SELECT 1
FROM
    t0
INNER JOIN t1
    USING (c0);

SELECT
    id,
    value
FROM
    (
        SELECT
            toLowCardinality(toNullable(0)) AS id,
            1 AS value
    ) AS a
INNER JOIN (
        SELECT toLowCardinality(0) AS id
    ) AS d
    USING (id);

SELECT
    id,
    value
FROM
    (
        SELECT
            toNullable(0) AS id,
            1 AS value
    ) AS a
INNER JOIN (
        SELECT toLowCardinality(0) AS id
    ) AS d
    USING (id);

SELECT
    id,
    value
FROM
    (
        SELECT
            toLowCardinality(toNullable(0)) AS id,
            1 AS value
    ) AS a
INNER JOIN (
        SELECT toLowCardinality(toNullable(0)) AS id
    ) AS d
    USING (id);

SELECT
    id,
    value
FROM
    (
        SELECT
            toLowCardinality(toNullable(0)) AS id,
            1 AS value
    ) AS a
INNER JOIN (
        SELECT materialize(toLowCardinality(toNullable(0))) AS id
    ) AS d
    USING (id);

SELECT COUNT(*)
FROM
    t2
INNER JOIN t3
    USING (c0);