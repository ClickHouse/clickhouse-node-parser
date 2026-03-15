CREATE TABLE totimezone_op_mono(i int, tz String, create_time DateTime) ENGINE MergeTree PARTITION BY toDate(create_time) ORDER BY i;
SET max_rows_to_read = 1;
SELECT count() FROM totimezone_op_mono WHERE toTimeZone(create_time, 'UTC') = '2020-09-01 00:00:00';
