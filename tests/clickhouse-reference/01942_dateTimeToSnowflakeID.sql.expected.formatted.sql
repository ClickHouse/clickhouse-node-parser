SELECT '-- Negative tests';

SELECT dateTimeToSnowflakeID();

SELECT dateTime64ToSnowflakeID();

SELECT dateTimeToSnowflakeID('invalid_dt');

SELECT dateTime64ToSnowflakeID('invalid_dt');

SELECT dateTimeToSnowflakeID(now(), 'invalid_epoch');

SELECT dateTime64ToSnowflakeID(now64(), 'invalid_epoch');

SELECT dateTimeToSnowflakeID(now(), 42, 'too_many_args');

SELECT dateTime64ToSnowflakeID(now64(), 42, 'too_many_args');

SELECT toTypeName(dateTimeToSnowflakeID(now()));

SELECT toTypeName(dateTime64ToSnowflakeID(now64()));