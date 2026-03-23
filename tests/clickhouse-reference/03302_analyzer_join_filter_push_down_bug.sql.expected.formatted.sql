CREATE TABLE t1
(
    key Int32,
    value DateTime
)
ENGINE = Log;

INSERT INTO t1 SELECT
    number,
    number
FROM numbers(10000);

CREATE TABLE t2
ENGINE = Log AS
SELECT
    key AS key1,
    value
FROM t1;