SELECT a
FROM (
        SELECT
            key + 1 AS a,
            key
        FROM t1
        GROUP BY key
    )
WHERE key
FORMAT Null;

SELECT key
FROM
    (
        SELECT key
        FROM t1
        GROUP BY key
    ) AS t1
INNER JOIN (
        SELECT key
        FROM t2
    ) AS t2
    ON t1.key = t2.key
WHERE key
FORMAT Null;