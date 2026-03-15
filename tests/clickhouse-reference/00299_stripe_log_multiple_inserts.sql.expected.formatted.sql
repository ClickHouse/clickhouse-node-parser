CREATE TABLE log
(
    x UInt8
)
ENGINE = StripeLog;

SELECT *
FROM log
ORDER BY x ASC;

CREATE TABLE log
(
    x UInt8
)
ENGINE = TinyLog;

CREATE TABLE log
(
    x UInt8
)
ENGINE = Log;