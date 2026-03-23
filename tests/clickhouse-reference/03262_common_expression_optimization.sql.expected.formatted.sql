SET enable_analyzer = 1;

SET optimize_extract_common_expressions = 1;

DROP TABLE IF EXISTS x;

CREATE TABLE x
(
    x Int64,
    A UInt8,
    B UInt8,
    C UInt8,
    D UInt8,
    E UInt8,
    F UInt8
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO x SELECT
    cityHash64(number) AS x,
    cityHash64(number + 1) % 2 AS A,
    cityHash64(number + 2) % 2 AS B,
    cityHash64(number + 3) % 2 AS C,
    cityHash64(number + 4) % 2 AS D,
    cityHash64(number + 5) % 2 AS E,
    cityHash64(number + 6) % 2 AS F
FROM numbers(2000);

-- Test multiple cases
SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C
    AND E)
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C
    AND E)
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE A
    AND (((B
    AND ((C
    AND E)))
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE A
    AND (((B
    AND ((C
    AND E)))
    OR (B
    AND C
    AND F)))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (B
    AND D)
    OR (B
    AND E)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (B
    AND D)
    OR (B
    AND E)))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (((B
    AND D)
    OR (B
    AND E)))))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE A
    AND (((B
    AND C)
    OR (((B
    AND D)
    OR (B
    AND E)))))
ORDER BY x ASC
LIMIT 10;

-- Without AND as a root
SELECT *
FROM x
WHERE ((B
    AND C)
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((B
    AND C)
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE ((B
    AND C
    AND E)
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((B
    AND C
    AND E)
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE ((B
    AND ((C
    AND E)))
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((B
    AND ((C
    AND E)))
    OR (B
    AND C
    AND F))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE ((B
    AND C)
    OR (B
    AND D)
    OR (B
    AND E))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((B
    AND C)
    OR (B
    AND D)
    OR (B
    AND E))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE ((B
    AND C)
    OR (((B
    AND D)
    OR (B
    AND E))))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((B
    AND C)
    OR (((B
    AND D)
    OR (B
    AND E))))
ORDER BY x ASC
LIMIT 10;

-- Complex expression
SELECT *
FROM x
WHERE (A
    AND (sipHash64(C) = sipHash64(D)))
    OR (B
    AND (sipHash64(C) = sipHash64(D)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE (A
    AND (sipHash64(C) = sipHash64(D)))
    OR (B
    AND (sipHash64(C) = sipHash64(D)))
ORDER BY x ASC
LIMIT 10;

-- Flattening is only happening if something can be extracted
SELECT *
FROM x
WHERE ((A
    AND B)
    OR (((C
    AND D)
    OR (E
    AND F))))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((A
    AND B)
    OR (((C
    AND D)
    OR (E
    AND F))))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE ((A
    AND B)
    OR (((B
    AND D)
    OR (E
    AND F))))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE ((A
    AND B)
    OR (((B
    AND D)
    OR (E
    AND F))))
ORDER BY x ASC
LIMIT 10;

-- Duplicates
SELECT *
FROM x
WHERE (A
    AND B
    AND C)
    OR (((A
    AND A
    AND A
    AND B
    AND B
    AND E
    AND E)
    OR (A
    AND B
    AND B
    AND F
    AND F)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE (A
    AND B
    AND C)
    OR (((A
    AND A
    AND A
    AND B
    AND B
    AND E
    AND E)
    OR (A
    AND B
    AND B
    AND F
    AND F)))
ORDER BY x ASC
LIMIT 10;

SELECT *
FROM x
WHERE (((A
    AND B
    AND C)
    OR (A
    AND B
    AND D)))
    AND (((B
    AND A
    AND E)
    OR (B
    AND A
    AND F)))
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE (((A
    AND B
    AND C)
    OR (A
    AND B
    AND D)))
    AND (((B
    AND A
    AND E)
    OR (B
    AND A
    AND F)))
ORDER BY x ASC
LIMIT 10;

DROP TABLE IF EXISTS y;

CREATE TABLE y
(
    x Int64,
    A UInt8,
    B UInt8,
    C UInt8,
    D UInt8,
    E UInt8,
    F UInt8
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO y SELECT
    murmurHash3_64(number) AS x,
    murmurHash3_64(number + 1) % 2 AS A,
    murmurHash3_64(number + 2) % 2 AS B,
    murmurHash3_64(number + 3) % 2 AS C,
    murmurHash3_64(number + 4) % 2 AS D,
    murmurHash3_64(number + 5) % 2 AS E,
    murmurHash3_64(number + 6) % 2 AS F
FROM numbers(2000);

-- JOIN expressions
-- As the optimization code is shared between ON and WHERE, it is enough to test that the optimization is done also in ON
SELECT *
FROM
    x
INNER JOIN y
    ON ((x.A = y.A)
    AND x.B = 1)
    OR ((x.A = y.A)
    AND y.C = 1)
ORDER BY `ALL` ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM
    x
INNER JOIN y
    ON ((x.A = y.A)
    AND x.B = 1)
    OR ((x.A = y.A)
    AND y.C = 1)
ORDER BY `ALL` ASC
LIMIT 10;

-- Duplicated subexpressions, found by fuzzer
SELECT *
FROM x
WHERE (D
    AND 5)
    OR (((C
    AND E))
    AND ((C
    AND E)))
ORDER BY `ALL` ASC
LIMIT 3
SETTINGS optimize_extract_common_expressions = 0;

SELECT *
FROM x
WHERE (D
    AND 5)
    OR (((C
    AND E))
    AND ((C
    AND E)))
ORDER BY `ALL` ASC
LIMIT 3;

-- HAVING
SELECT
    x,
    max(A) AS mA,
    max(B) AS mB,
    max(C) AS mC
FROM x
GROUP BY x
HAVING (mA
    AND mB)
    OR (mA
    AND mC)
ORDER BY x ASC
LIMIT 10
SETTINGS optimize_extract_common_expressions = 0;

SELECT
    x,
    max(A) AS mA,
    max(B) AS mB,
    max(C) AS mC
FROM x
GROUP BY x
HAVING (mA
    AND mB)
    OR (mA
    AND mC)
ORDER BY x ASC
LIMIT 10;

-- QUALIFY
SELECT
    x,
    max(A) OVER (PARTITION BY x % 1000) AS mA,
    max(B) OVER (PARTITION BY x % 1000) AS mB,
    max(C) OVER (PARTITION BY x % 1000) AS mC
FROM x
ORDER BY x ASC
LIMIT 10
QUALIFY (mA
    AND mB)
    OR (mA
    AND mC)
SETTINGS optimize_extract_common_expressions = 0;

SELECT
    x,
    max(A) OVER (PARTITION BY x % 1000) AS mA,
    max(B) OVER (PARTITION BY x % 1000) AS mB,
    max(C) OVER (PARTITION BY x % 1000) AS mC
FROM x
ORDER BY x ASC
LIMIT 10
QUALIFY (mA
    AND mB)
    OR (mA
    AND mC);