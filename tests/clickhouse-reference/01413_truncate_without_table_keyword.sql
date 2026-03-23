CREATE TABLE truncate_test(uint8 UInt8) ENGINE = Log;
INSERT INTO truncate_test VALUES(1), (2), (3);
SELECT * FROM truncate_test ORDER BY uint8;
