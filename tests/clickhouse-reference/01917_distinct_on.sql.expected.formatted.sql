SELECT DISTINCT ON (a, b)
    a,
    b,
    c
FROM t1;

SELECT DISTINCT ON (a, b) *
FROM t1;

SELECT DISTINCT ON (a) *
FROM t1;