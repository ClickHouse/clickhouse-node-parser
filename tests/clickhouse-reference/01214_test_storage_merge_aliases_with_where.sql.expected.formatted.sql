-- { echo  }
SELECT *
FROM tt_m
ORDER BY a ASC;

SELECT *
FROM tt_m
WHERE b != 0
ORDER BY
    b ASC,
    a ASC;

SELECT *
FROM tt_m
WHERE b != 1
ORDER BY
    b ASC,
    a ASC;

SELECT *
FROM tt_m
WHERE b != a * 2
ORDER BY
    b ASC,
    a ASC;

SELECT *
FROM tt_m
WHERE b / 2 != a
ORDER BY
    b ASC,
    a ASC;

SELECT b
FROM tt_m
WHERE b >= 0
ORDER BY
    b ASC,
    a ASC;

SELECT b
FROM tt_m
WHERE b == 12;

SELECT b
FROM tt_m
ORDER BY
    b ASC,
    a ASC;

SELECT
    b,
    count()
FROM tt_m
GROUP BY b
ORDER BY b ASC;

SELECT b
FROM tt_m
ORDER BY b ASC
LIMIT 1 BY b;

SELECT a
FROM tt_m
WHERE b = 12;

SELECT max(a)
FROM tt_m
GROUP BY b
ORDER BY b ASC;

SELECT a
FROM tt_m
ORDER BY
    b ASC,
    a ASC;