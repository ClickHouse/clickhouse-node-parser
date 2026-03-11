SELECT *
FROM summing_composite_key
ORDER BY
    d ASC,
    k ASC,
    FirstMap.k1 ASC,
    FirstMap.k2ID ASC,
    FirstMap.s ASC,
    SecondMap.k1ID ASC,
    SecondMap.k2Key ASC,
    SecondMap.k3Type ASC,
    SecondMap.s ASC;

SELECT
    d,
    k,
    m.k1,
    m.k2ID,
    m.s
FROM
    summing_composite_key
ARRAY JOIN FirstMap AS m
ORDER BY
    d ASC,
    k ASC,
    m.k1 ASC,
    m.k2ID ASC,
    m.s ASC,
    SecondMap.k1ID ASC,
    SecondMap.k2Key ASC,
    SecondMap.k3Type ASC,
    SecondMap.s ASC;

SELECT
    d,
    k,
    m.k1,
    m.k2ID,
    sum(m.s)
FROM
    summing_composite_key
ARRAY JOIN FirstMap AS m
GROUP BY
    d,
    k,
    m.k1,
    m.k2ID
ORDER BY
    d ASC,
    k ASC,
    m.k1 ASC,
    m.k2ID ASC;

SELECT
    d,
    k,
    m.k1,
    m.k2ID,
    m.s
FROM
    summing_composite_key FINAL
ARRAY JOIN FirstMap AS m
ORDER BY
    d ASC,
    k ASC,
    m.k1 ASC,
    m.k2ID ASC,
    m.s ASC;

SELECT
    d,
    k,
    m.k1ID,
    m.k2Key,
    m.k3Type,
    m.s
FROM
    summing_composite_key
ARRAY JOIN SecondMap AS m
ORDER BY
    d ASC,
    k ASC,
    m.k1ID ASC,
    m.k2Key ASC,
    m.k3Type ASC,
    m.s ASC;

SELECT
    d,
    k,
    m.k1ID,
    m.k2Key,
    m.k3Type,
    sum(m.s)
FROM
    summing_composite_key
ARRAY JOIN SecondMap AS m
GROUP BY
    d,
    k,
    m.k1ID,
    m.k2Key,
    m.k3Type
ORDER BY
    d ASC,
    k ASC,
    m.k1ID ASC,
    m.k2Key ASC,
    m.k3Type ASC;

SELECT
    d,
    k,
    m.k1ID,
    m.k2Key,
    m.k3Type,
    m.s
FROM
    summing_composite_key FINAL
ARRAY JOIN SecondMap AS m
ORDER BY
    d ASC,
    k ASC,
    m.k1ID ASC,
    m.k2Key ASC,
    m.k3Type ASC,
    m.s ASC;

SELECT
    d,
    k,
    m.k1,
    m.k2ID,
    m.s
FROM
    summing_composite_key
ARRAY JOIN FirstMap AS m
ORDER BY
    d ASC,
    k ASC,
    m.k1 ASC,
    m.k2ID ASC,
    m.s ASC;