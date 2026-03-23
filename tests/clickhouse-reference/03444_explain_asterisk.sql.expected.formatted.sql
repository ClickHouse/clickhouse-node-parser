-- Fuzzing `Can't set alias of * of Asterisk on alias`
DROP TABLE IF EXISTS t1, t2, t3__fuzz_0;

CREATE TABLE t1
(
    a UInt64,
    b UInt64
)
ENGINE = Log;

CREATE TABLE t2
(
    a UInt64,
    b UInt64
)
ENGINE = Log;

CREATE TABLE t3__fuzz_0
(
    a LowCardinality(UInt64),
    b UInt64
)
ENGINE = Log
SETTINGS allow_suspicious_low_cardinality_types = 1;

SET enable_analyzer = 0;

SET enable_analyzer = 1;