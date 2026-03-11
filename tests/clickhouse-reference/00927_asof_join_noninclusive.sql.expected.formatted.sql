SELECT
    A.k,
    toString(A.t, 'UTC'),
    A.a,
    B.b,
    toString(B.t, 'UTC'),
    B.k
FROM
    A
LEFT JOIN B
    USING (k, t)
ORDER BY (A.k, A.t) ASC;

SELECT
    A.k,
    toString(A.t, 'UTC'),
    A.a,
    B.b,
    toString(B.t, 'UTC'),
    B.k
FROM
    A
INNER JOIN B
    ON A.k == B.k
    AND A.t >= B.t
ORDER BY (A.k, A.t) ASC;

SELECT
    A.k,
    toString(A.t, 'UTC'),
    A.a,
    B.b,
    toString(B.t, 'UTC'),
    B.k
FROM
    A
INNER JOIN B
    USING (k, t)
ORDER BY (A.k, A.t) ASC;