SELECT toDateTime64(toDateTime(1, 'Asia/Istanbul'), 2);

SELECT toDateTime64(toDate(1), 2)
FORMAT Null;

SELECT toDateTime64(toDateTime(1), 2)
FORMAT Null;

SELECT toDateTime64(toDateTime(1), 2, 'Asia/Istanbul');

SELECT toDateTime64(toDate(1), 2, 'Asia/Istanbul');

SELECT toDateTime64(toDateTime(1), 2, 'GMT');

SELECT toDateTime64(toDate(1), 2, 'GMT');