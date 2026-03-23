CREATE TABLE t1
(
    a UInt32,
    b UInt32,
    c UInt32
)
ENGINE = Memory;

INSERT INTO t1;

SELECT DISTINCT ON (a, b)
    a,
    b,
    c
FROM t1;

SELECT DISTINCT ON (a, b) *
FROM t1;

SELECT DISTINCT ON (a) *
FROM t1;