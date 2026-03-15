CREATE TABLE t1
(
    key Int32,
    value DateTime
)
ENGINE = Log;

CREATE TABLE t2
ENGINE = Log AS
SELECT
    key AS key1,
    value
FROM t1;