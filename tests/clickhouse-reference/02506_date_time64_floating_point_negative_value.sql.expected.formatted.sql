SELECT toUnixTimestamp64Milli(toDateTime64('1969-12-31 23:59:59.999', 3, 'Europe/Amsterdam'));

SELECT toUnixTimestamp64Milli(toDateTime64('1969-12-31 23:59:59.999', 3, 'UTC'));

SELECT fromUnixTimestamp64Milli(toInt64(-1), 'Europe/Amsterdam');

SELECT fromUnixTimestamp64Milli(toInt64(-1), 'UTC');