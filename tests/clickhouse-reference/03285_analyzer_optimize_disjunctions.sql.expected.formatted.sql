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