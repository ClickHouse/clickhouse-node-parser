SELECT count(x)
FROM tdm
WHERE toDate(x) < toDate(now(), 'Asia/Istanbul')
SETTINGS max_rows_to_read = 1;

SELECT
    toDate(-1),
    toDate(10000000000000, 'Asia/Istanbul'),
    toDate(100),
    toDate(65536, 'UTC'),
    toDate(65535, 'Asia/Istanbul');

SELECT
    toDateTime(-1, 'Asia/Istanbul'),
    toDateTime(10000000000000, 'Asia/Istanbul'),
    toDateTime(1000, 'Asia/Istanbul');

SELECT toDateTime(timestamp)
FROM tdm2
WHERE toHour(toDateTime(timestamp)) = 13;