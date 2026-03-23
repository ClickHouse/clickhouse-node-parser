CREATE TABLE log
(
    x UInt8
)
ENGINE = StripeLog;

SELECT *
FROM log
ORDER BY x ASC;

INSERT INTO log;

INSERT INTO log;

INSERT INTO log;

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