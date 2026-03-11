SELECT *
FROM t
ORDER BY i ASC;

SELECT toDateTime64(1111111111.222, 3, 'Asia/Istanbul');

SELECT toDateTime64('1111111111.222', 3, 'Asia/Istanbul');

SELECT toDateTime64('1111111111222', 3, 'Asia/Istanbul');

SELECT ignore(toDateTime64(1111111111222, 3, 'Asia/Istanbul'));