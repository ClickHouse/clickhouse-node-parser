SELECT timestamp
FROM test_datetime;

SELECT formatDateTime(toDateTime('2020-10-15 00:00:00', 'Asia/Istanbul'), '%Y-%m-%d %R:%S') AS formatted_simple
FROM test_datetime;

SELECT formatDateTime(toDateTime('2020-10-15 00:00:00', 'Asia/Istanbul'), '%Y-%m-%dT%R:%SZ', 'UTC') AS formatted_iso
FROM test_datetime;

SELECT toUnixTimestamp(timestamp)
FROM test_datetime;