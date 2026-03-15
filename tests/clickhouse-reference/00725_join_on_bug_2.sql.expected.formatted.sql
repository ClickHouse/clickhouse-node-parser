SET joined_subquery_requires_alias = 0;

CREATE TABLE t_00725_2
(
    a Int64,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE s_00725_2
(
    a Int64,
    b Int64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    a,
    b,
    s_a,
    s_b
FROM
    t_00725_2
LEFT JOIN (
        SELECT
            a,
            b,
            a AS s_a,
            b AS s_b
        FROM s_00725_2
    )
    USING (a, b)
ORDER BY `ALL` ASC;

SELECT
    t_00725_2.*,
    s_00725_2.*
FROM
    t_00725_2
LEFT JOIN s_00725_2
    USING (a, b)
ORDER BY `ALL` ASC;

SELECT
    a,
    b,
    s_a,
    s_b
FROM
    t_00725_2
LEFT JOIN (
        SELECT
            a,
            b,
            a AS s_a,
            b AS s_b
        FROM s_00725_2
    ) AS s_00725_2
    ON (s_00725_2.a = t_00725_2.a
    AND s_00725_2.b = t_00725_2.b)
ORDER BY `ALL` ASC;

SELECT *
FROM
    t_00725_2
LEFT JOIN (
        SELECT
            a AS s_a,
            b AS s_b
        FROM s_00725_2
    )
    ON (s_a = t_00725_2.a
    AND s_b = t_00725_2.b)
ORDER BY `ALL` ASC;

SELECT
    a,
    b,
    s_a,
    s_b
FROM
    t_00725_2
LEFT JOIN (
        SELECT
            a,
            b,
            a AS s_a,
            b AS s_b
        FROM s_00725_2
    )
    ON (s_a = t_00725_2.a
    AND s_b = t_00725_2.b)
ORDER BY `ALL` ASC;

SELECT
    t_00725_2.*,
    s_00725_2.*
FROM
    t_00725_2
LEFT JOIN s_00725_2
    ON (s_00725_2.a = t_00725_2.a
    AND s_00725_2.b = t_00725_2.b)
ORDER BY `ALL` ASC;