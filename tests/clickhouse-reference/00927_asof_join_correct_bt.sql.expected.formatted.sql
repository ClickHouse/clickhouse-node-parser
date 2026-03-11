SELECT
    A.k,
    A.t,
    A.a,
    B.b,
    B.t,
    B.k
FROM
    A
LEFT JOIN B1 AS B
    USING (k, t)
ORDER BY (A.k, A.t) ASC;

SELECT
    A.k,
    A.t,
    A.a,
    B.b,
    B.t,
    B.k
FROM
    A
LEFT JOIN B2 AS B
    USING (k, t)
ORDER BY (A.k, A.t) ASC;

SELECT
    A.k,
    A.t,
    A.a,
    B.b,
    B.t,
    B.k
FROM
    A
LEFT JOIN B3 AS B
    USING (k, t)
ORDER BY (A.k, A.t) ASC;