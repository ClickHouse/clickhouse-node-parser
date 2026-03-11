SELECT addMonths(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 1, 'Asia/Kolkata');
SELECT addMonths(toDateTime('2017-11-05 10:37:47', 'Asia/Kolkata'), 1);
SELECT addMonths(toTimeZone(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 'Asia/Kolkata'), 1);
SELECT addMonths(toDateTime('2017-11-05 08:07:47'), 1);
SELECT addMonths(materialize(toDateTime('2017-11-05 08:07:47')), 1);
SELECT addMonths(toDateTime('2017-11-05 08:07:47'), materialize(1));
SELECT addMonths(materialize(toDateTime('2017-11-05 08:07:47')), materialize(1));
SELECT addMonths(toDateTime('2017-11-05 08:07:47'), -1);
SELECT addMonths(materialize(toDateTime('2017-11-05 08:07:47')), -1);
SELECT addMonths(toDateTime('2017-11-05 08:07:47'), materialize(-1));
SELECT addMonths(materialize(toDateTime('2017-11-05 08:07:47')), materialize(-1));
SELECT toUnixTimestamp('2017-11-05 08:07:47', 'Asia/Istanbul');
SELECT toUnixTimestamp(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 'Asia/Istanbul');
SELECT toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul');
SELECT toTimeZone(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 'Asia/Kolkata');
SELECT toString(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'));
SELECT toString(toTimeZone(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 'Asia/Kolkata'));
SELECT toString(toDateTime('2017-11-05 08:07:47', 'Asia/Istanbul'), 'Asia/Kolkata');
SELECT '-- Test const timezone arguments --';
SELECT val FROM tab WHERE now(tz) != toDateTime('2000-01-01 00:00:00') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE now(tz) != toDateTime('2000-01-01 00:00:00') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE now64(9, tz) != toDateTime64('2000-01-01 00:00:00', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE now64(9, tz) != toDateTime64('2000-01-01 00:00:00', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE nowInBlock(tz) != toDateTime('2000-01-01 00:00:00') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE nowInBlock(tz) != toDateTime('2000-01-01 00:00:00') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE toTimeZone(toDateTime(val), tz) != toDateTime('2023-06-11 14:14:14') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE toTimeZone(toDateTime(val), tz) != toDateTime('2023-06-11 14:14:14') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE fromUnixTimestamp64Milli(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE fromUnixTimestamp64Milli(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE fromUnixTimestamp64Micro(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE fromUnixTimestamp64Micro(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE fromUnixTimestamp64Nano(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE fromUnixTimestamp64Nano(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE snowflakeToDateTime(val, tz) != toDateTime('2023-06-11 14:14:14') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE snowflakeToDateTime(val, tz) != toDateTime('2023-06-11 14:14:14') ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT val FROM tab WHERE snowflakeToDateTime64(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 0; -- { serverError ILLEGAL_COLUMN }
SELECT val FROM tab WHERE snowflakeToDateTime64(val, tz) != toDateTime64('2023-06-11 14:14:14', 6) ORDER BY val SETTINGS allow_nonconst_timezone_arguments = 1;
