CREATE TABLE t1
(
    x UInt32,
    str String
)
ENGINE = Memory;

CREATE TABLE left_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `LEFT`, x);

CREATE TABLE inner_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `INNER`, x);

CREATE TABLE right_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `RIGHT`, x);

CREATE TABLE full_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `FULL`, x);

SET join_use_nulls = 0;

SELECT *
FROM
    t1
LEFT JOIN left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
INNER JOIN inner_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
FULL JOIN full_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SET join_use_nulls = 1;

CREATE TABLE left_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `LEFT`, x)
SETTINGS join_use_nulls = 1;

CREATE TABLE inner_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `INNER`, x)
SETTINGS join_use_nulls = 1;

CREATE TABLE right_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `RIGHT`, x)
SETTINGS join_use_nulls = 1;

CREATE TABLE full_join
(
    x UInt32,
    s String
)
ENGINE = Join(`ALL`, `FULL`, x)
SETTINGS join_use_nulls = 1;