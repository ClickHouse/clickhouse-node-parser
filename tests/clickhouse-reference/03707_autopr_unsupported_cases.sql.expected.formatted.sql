SELECT AVG(transfer)
FROM (
        SELECT
            number,
            SUM(number) AS transfer
        FROM t
        GROUP BY number
    )
FORMAT Null;

SELECT count()
FROM t
WHERE pointInPolygon((number, number), (
        SELECT *
        FROM crd
    ))
FORMAT Null;

SELECT *
FROM t
UNION ALL
SELECT *
FROM t
FORMAT Null;

SELECT *
FROM
    t AS lhs
INNER JOIN t AS rhs
    ON lhs.number = rhs.number
LIMIT 1
FORMAT Null;

SELECT min(a)
FROM tt
SETTINGS optimize_aggregation_in_order = 0;