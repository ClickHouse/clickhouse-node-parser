CREATE TABLE t1
(
    x UInt32,
    str String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE any_left_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ANY`, `LEFT`, x);

CREATE TABLE any_inner_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ANY`, `INNER`, x);

CREATE TABLE any_right_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ANY`, `RIGHT`, x);

CREATE TABLE semi_left_join
(
    x UInt32,
    s String
)
ENGINE = Join(SEMI, `LEFT`, x);

CREATE TABLE semi_right_join
(
    x UInt32,
    s String
)
ENGINE = Join(SEMI, `RIGHT`, x);

CREATE TABLE anti_left_join
(
    x UInt32,
    s String
)
ENGINE = Join(ANTI, `LEFT`, x);

CREATE TABLE anti_right_join
(
    x UInt32,
    s String
)
ENGINE = Join(ANTI, `RIGHT`, x);

SET join_use_nulls = 0;

SET any_join_distinct_right_table_keys = 0;

SET parallel_replicas_local_plan = 1;

SELECT *
FROM
    t1
LEFT JOIN any_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
INNER JOIN any_inner_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN any_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
LEFT JOIN semi_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN semi_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
LEFT JOIN anti_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN anti_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;