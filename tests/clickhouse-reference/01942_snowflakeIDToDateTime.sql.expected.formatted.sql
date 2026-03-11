SELECT '-- Negative tests';

SELECT snowflakeIDToDateTime();

SELECT snowflakeIDToDateTime64();

SELECT snowflakeIDToDateTime('invalid_snowflake');

SELECT snowflakeIDToDateTime64('invalid_snowflake');

SELECT snowflakeIDToDateTime(123::UInt64, 'invalid_epoch');

SELECT snowflakeIDToDateTime64(123::UInt64, 'invalid_epoch');

SELECT snowflakeIDToDateTime(123::UInt64, materialize(42));

SELECT snowflakeIDToDateTime64(123::UInt64, materialize(42));

SELECT snowflakeIDToDateTime(123::UInt64, 42, 42);

SELECT snowflakeIDToDateTime64(123::UInt64, 42, 42);

SELECT snowflakeIDToDateTime(123::UInt64, 42, 'UTC', 'too_many_args');

SELECT snowflakeIDToDateTime64(123::UInt64, 42, 'UTC', 'too_many_args');

SELECT toTypeName(snowflakeIDToDateTime(123::UInt64));

SELECT toTypeName(snowflakeIDToDateTime64(123::UInt64));