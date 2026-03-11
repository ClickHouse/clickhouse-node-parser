SELECT count()
FROM t0
GROUP BY gcd(negate(sign(c0)), negate(c0))
SETTINGS optimize_use_implicit_projections = 1;

SELECT c0
FROM t1
ORDER BY sin(negate(c0)) ASC
SETTINGS optimize_read_in_order = 0;

SELECT c0
FROM t1
ORDER BY sin(negate(c0)) ASC
SETTINGS optimize_read_in_order = 1;