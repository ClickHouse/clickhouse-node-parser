CREATE TABLE t
(
    x UInt8
)
ENGINE = TinyLog;

INSERT INTO t;

INSERT INTO t SELECT *
FROM t;

SELECT count()
FROM t;

CREATE TABLE t
(
    x UInt8
)
ENGINE = Log;

CREATE TABLE t
(
    x UInt8
)
ENGINE = StripeLog;