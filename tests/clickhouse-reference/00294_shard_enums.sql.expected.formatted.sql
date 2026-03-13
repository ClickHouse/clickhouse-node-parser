SELECT *
FROM enums;

SELECT *
FROM enums
ORDER BY _part ASC;

-- ORDER BY
SELECT *
FROM enums
ORDER BY e ASC;

SELECT *
FROM enums
ORDER BY e DESC;

-- GROUP BY
SELECT
    count(),
    e
FROM enums
GROUP BY e
ORDER BY e ASC;

SELECT any(e)
FROM enums;

-- IN
SELECT *
FROM enums
WHERE e IN ('a', 'd');

SELECT *
FROM enums
WHERE e IN (
        SELECT e
        FROM enums
    );

-- DISTINCT
SELECT DISTINCT e
FROM enums;

-- Comparison
SELECT *
FROM enums
WHERE e = e;

SELECT *
FROM enums
WHERE e = 'a'
    OR e = 'd';

SELECT *
FROM enums
WHERE e != 'a';

SELECT
    *,
    e < 'b'
FROM enums;

SELECT
    *,
    e > 'b'
FROM enums;

-- Conversion
SELECT
    toInt8(e),
    toInt16(e),
    toUInt64(e),
    toString(e),
    e
FROM enums;

SELECT *
FROM enums_copy;

SELECT *
FROM remote('127.0.0.2', currentDatabase(), enums_copy);