SELECT *
FROM mergetree_00712;

SELECT *
FROM mergetree_00712
ORDER BY x ASC;

SELECT s
FROM mergetree_00712
PREWHERE x
    AND y
ORDER BY s ASC;

SELECT
    s,
    y
FROM mergetree_00712
PREWHERE x
    AND y
ORDER BY s ASC;