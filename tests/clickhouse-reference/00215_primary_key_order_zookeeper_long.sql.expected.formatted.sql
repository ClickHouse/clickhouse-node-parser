SELECT x
FROM primary_key
ORDER BY x ASC;

SELECT x
FROM primary_key
WHERE negate(x) < -1
ORDER BY x ASC;