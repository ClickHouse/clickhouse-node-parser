SELECT count()
FROM
(
    SELECT
        1 AS a,
        2 AS b
    INTERSECT ALL
    SELECT
        1,
        1
);
SELECT count()
FROM
(
    SELECT
        1 AS a,
        2 AS b
    EXCEPT ALL
    SELECT
        1,
        1
);
