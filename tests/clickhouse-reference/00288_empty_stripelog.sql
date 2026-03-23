CREATE TABLE stripelog (x UInt8) ENGINE = StripeLog;
SELECT * FROM stripelog ORDER BY x;
INSERT INTO stripelog VALUES (1), (2);
