DROP TABLE IF EXISTS t0;

DROP TABLE IF EXISTS t1;

DROP TABLE IF EXISTS t2;

CREATE TABLE t0
(
    c0 Int16,
    PROJECTION h (    SELECT
        min(c0),
        max(c0),
        count()
    GROUP BY negate(c0))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t0 (c0);

SELECT count()
FROM t0
GROUP BY gcd(negate(sign(c0)), negate(c0))
SETTINGS optimize_use_implicit_projections = 1;

CREATE TABLE t1
(
    c0 Int32
)
ENGINE = MergeTree
ORDER BY sin(c0);

INSERT INTO t1;

SELECT c0
FROM t1
ORDER BY sin(negate(c0)) ASC
SETTINGS optimize_read_in_order = 0;

SELECT c0
FROM t1
ORDER BY sin(negate(c0)) ASC
SETTINGS optimize_read_in_order = 1;

DROP TABLE t0;

DROP TABLE t1;