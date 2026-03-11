SELECT
    (
        SELECT max(i)
        FROM t1
    ) AS i,
    (
        SELECT max(i)
        FROM t1
    ) AS j,
    (
        SELECT max(i)
        FROM t1
    ) AS k,
    (
        SELECT max(i)
        FROM t1
    ) AS l
FROM t1;

SELECT 1;