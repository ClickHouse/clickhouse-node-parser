SELECT b
FROM pk_order
ORDER BY
    a ASC,
    b ASC;

SELECT a
FROM pk_order
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b
FROM pk_order
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b
FROM pk_order
ORDER BY
    a DESC,
    b ASC;

SELECT
    a,
    b
FROM pk_order
ORDER BY
    a ASC,
    b DESC;

SELECT
    a,
    b
FROM pk_order
ORDER BY
    a DESC,
    b DESC;

SELECT a
FROM pk_order
ORDER BY a DESC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a ASC,
    b ASC,
    c ASC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a DESC,
    b ASC,
    c ASC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a ASC,
    b DESC,
    c ASC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a ASC,
    b ASC,
    c DESC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a DESC,
    b DESC,
    c ASC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a DESC,
    b ASC,
    c DESC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a ASC,
    b DESC,
    c DESC;

SELECT
    a,
    b,
    c
FROM pk_order
ORDER BY
    a DESC,
    b DESC,
    c DESC;

SELECT d
FROM pk_order
ORDER BY d ASC
LIMIT 5;

SELECT
    d,
    b
FROM pk_order
ORDER BY
    d ASC,
    b ASC
LIMIT 5;

SELECT
    d,
    a
FROM pk_order
ORDER BY
    d DESC,
    a DESC
LIMIT 5;

SELECT
    d,
    a
FROM pk_order
ORDER BY
    d DESC,
    negate(a) ASC
LIMIT 5;

SELECT toStartOfHour(d) AS d1
FROM pk_order
ORDER BY d1 ASC
LIMIT 5;

SELECT *
FROM pk_order
ORDER BY
    (a / b) ASC,
    a ASC
LIMIT 5;