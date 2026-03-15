CREATE TABLE t (x UInt8) ENGINE = TinyLog;
SELECT count() FROM t;
CREATE TABLE t (x UInt8) ENGINE = Log;
CREATE TABLE t (x UInt8) ENGINE = StripeLog;
