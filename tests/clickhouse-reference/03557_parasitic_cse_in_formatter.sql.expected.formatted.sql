SELECT
    (1, (1 AS c0, 1 AS c0) IS NULL AS c0),
    isNull((1, (1, 1 AS c0) IS NULL AS c0)) AS c0;

SELECT
    (1,1) AS c0,
    (1,(1)) AS c0;

SELECT ((-5 AS b)) IN (-5 AS b);