CREATE TABLE t0
(
    c0 Nullable(Int)
)
ENGINE = Memory()
SETTINGS compress = 1;

SELECT t0.c0.`null`
FROM t0
FORMAT Null
SETTINGS enable_analyzer = 1;