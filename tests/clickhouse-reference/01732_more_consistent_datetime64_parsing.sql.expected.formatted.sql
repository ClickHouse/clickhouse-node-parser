CREATE TEMPORARY TABLE t
(
    i UInt8,
    x DateTime64(3, 'UTC')
);

INSERT INTO t;

INSERT INTO t;

INSERT INTO t;

INSERT INTO t;

SELECT *
FROM t
ORDER BY i ASC;

SELECT toDateTime64(1111111111.222, 3, 'Asia/Istanbul');

SELECT toDateTime64('1111111111.222', 3, 'Asia/Istanbul');

SELECT toDateTime64('1111111111222', 3, 'Asia/Istanbul');

SELECT ignore(toDateTime64(1111111111222, 3, 'Asia/Istanbul')); -- This gives somewhat correct but unexpected result