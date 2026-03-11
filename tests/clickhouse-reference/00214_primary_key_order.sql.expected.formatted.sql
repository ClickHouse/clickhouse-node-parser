SELECT x
FROM primary_key
ORDER BY x ASC;

SELECT
    'a',
    negate(x)
FROM primary_key
WHERE negate(x) < -3;

SELECT
    'b',
    negate(x)
FROM primary_key
WHERE negate(x) < -2;

SELECT
    'c',
    negate(x)
FROM primary_key
WHERE negate(x) < -1;

SELECT
    'd',
    negate(x)
FROM primary_key
WHERE negate(x) < toInt8(0);