-- Order after group by in order is determined
SELECT
    a,
    b
FROM pk_order
GROUP BY
    a,
    b
ORDER BY
    a ASC,
    b ASC;

SELECT a
FROM pk_order
GROUP BY a
ORDER BY a ASC;

SELECT
    a,
    b,
    sum(c),
    avg(d)
FROM pk_order
GROUP BY
    a,
    b
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    sum(c),
    avg(d)
FROM pk_order
GROUP BY a
ORDER BY a ASC;

SELECT
    negate(a),
    sum(c),
    avg(d)
FROM pk_order
GROUP BY negate(a)
ORDER BY negate(a) ASC;

SELECT
    d,
    max(b)
FROM pk_order
GROUP BY
    d,
    a
ORDER BY
    d ASC,
    a ASC
LIMIT 5;

SELECT
    toString(d),
    avg(a)
FROM pk_order
GROUP BY toString(d)
ORDER BY toString(d) ASC
LIMIT 5;

SELECT
    toStartOfHour(d) AS d1,
    min(a),
    max(b)
FROM pk_order
GROUP BY d1
ORDER BY d1 ASC
LIMIT 5;