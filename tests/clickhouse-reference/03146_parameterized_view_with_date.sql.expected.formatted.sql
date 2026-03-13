SELECT *
FROM pv(timestamp_param = toDateTime('2024-04-01 00:00:01'));

SELECT *
FROM pv(timestamp_param = toDateTime('2024-040')); -- { serverError CANNOT_PARSE_DATETIME }