SET enable_analyzer = 1;

SET optimize_extract_common_expressions = 1;

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

SELECT count()
FROM x
WHERE A
    OR B
    OR (B
    AND C)
SETTINGS optimize_extract_common_expressions = 0;

SELECT count()
FROM x
WHERE A
    OR B
    OR (B
    AND C)
SETTINGS optimize_extract_common_expressions = 1;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (B
    AND C)
    OR (B
    AND D
    AND A)
SETTINGS optimize_extract_common_expressions = 1;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (B
    AND C)
    OR (B
    AND D
    AND A)
SETTINGS optimize_extract_common_expressions = 0;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (A
    AND B
    AND C)
    OR (D
    AND E)
SETTINGS optimize_extract_common_expressions = 1;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (A
    AND B
    AND C)
    OR (D
    AND E)
SETTINGS optimize_extract_common_expressions = 0;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (A
    AND B
    AND C)
    OR (B
    AND C)
SETTINGS optimize_extract_common_expressions = 1;

SELECT count()
FROM x
WHERE (A
    AND B)
    OR (A
    AND B
    AND C)
    OR (B
    AND C)
SETTINGS optimize_extract_common_expressions = 0;