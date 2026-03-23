-- Tags: no-parallel
SET enable_analyzer = 1;

SYSTEM DROP  FUNCTION IF EXISTS f1;

SYSTEM DROP  TABLE IF EXISTS t1;

CREATE TABLE t1
(
    c0 String,
    c1 Int8
)
ENGINE = Memory();

CREATE FUNCTION f1 AS (p0, p1) -> *;

SELECT 1
FROM
    (
        SELECT 1 AS x
    ) AS t0
LEFT JOIN VALUES(f1(1, 2)) AS t1
    USING (x); -- { serverError UNKNOWN_IDENTIFIER }