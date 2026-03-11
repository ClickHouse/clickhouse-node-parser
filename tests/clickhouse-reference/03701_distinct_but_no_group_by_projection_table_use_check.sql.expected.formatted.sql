SELECT DISTINCT
    x,
    z
FROM tab;

SELECT DISTINCT z
FROM tab;

SELECT DISTINCT
    x,
    y
FROM tab;

SELECT DISTINCT
    x,
    z
FROM tab
WHERE x IN (1, 2)
    AND z < 5;

SELECT DISTINCT
    x / 2,
    y % 10
FROM tab;

SELECT DISTINCT x / 2
FROM tab;

SELECT DISTINCT
    x / 2,
    y
FROM tab;