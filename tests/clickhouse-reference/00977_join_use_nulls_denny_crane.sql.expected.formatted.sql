SELECT
    t.*,
    s.a,
    s.b,
    s.c
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT
    t.*,
    s.a,
    s.b,
    s.c
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT
    t.*,
    s.a,
    s.b,
    s.c
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;

SELECT
    t.*,
    s.a,
    s.b,
    s.c
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT *
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT
    t.*,
    s.*
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;

SELECT
    t.*,
    s.*
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;

SELECT
    t.*,
    s.*
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT
    t.*,
    s.*
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b);

SELECT *
FROM
    t
LEFT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;

SELECT *
FROM
    t
RIGHT JOIN s
    ON (s.a = t.a
    AND s.b = t.b)
SETTINGS join_use_nulls = 1;