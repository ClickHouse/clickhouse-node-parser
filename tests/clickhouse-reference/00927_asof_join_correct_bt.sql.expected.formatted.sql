CREATE TABLE A
(
    k UInt32,
    t UInt32,
    a UInt64
)
ENGINE = MergeTree()
ORDER BY (k, t);

CREATE TABLE B1
(
    k UInt32,
    t UInt32,
    b UInt64
)
ENGINE = MergeTree()
ORDER BY (k, t);

CREATE TABLE B2
(
    t UInt32,
    k UInt32,
    b UInt64
)
ENGINE = MergeTree()
ORDER BY (k, t);

CREATE TABLE B3
(
    k UInt32,
    b UInt64,
    t UInt32
)
ENGINE = MergeTree()
ORDER BY (k, t);

-- { echoOn }
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

SET join_algorithm = 'full_sorting_merge';