SELECT count()
FROM t
WHERE a = '0'
    AND b = '0'
    AND (c, d) IN ('0', '5');

SELECT count()
FROM t
WHERE a = '0'
    AND b = '0'
    AND (c, d) IN ('0', '5')
SETTINGS optimize_use_implicit_projections = 0;

SELECT count()
FROM t
WHERE a = '0'
    AND b = '0'
    AND (c, d) IN ('0', '2');

SELECT count()
FROM t
WHERE a = '0'
    AND b = '0'
    AND (c, d) IN ('0', '2')
SETTINGS optimize_use_implicit_projections = 0;