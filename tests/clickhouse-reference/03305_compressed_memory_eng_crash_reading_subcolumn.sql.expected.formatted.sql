-- Tags: memory-engine
SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Nullable(Int)
)
ENGINE = Memory()
SETTINGS compress = 1;

INSERT INTO t0 (c0);

SELECT t0.c0.`null`
FROM t0
FORMAT Null
SETTINGS enable_analyzer = 1;

SYSTEM DROP  TABLE t0;