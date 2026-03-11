SELECT t
FROM tab
WHERE t > '2020-01-01 01:01:01';

SELECT t
FROM tab
WHERE t + 1 > '2020-01-01 01:01:01';

SELECT
    x,
    y
FROM tab
WHERE (x + y) = 2;

SELECT
    x,
    y
FROM tab
WHERE (x + y) + 1 = 3;