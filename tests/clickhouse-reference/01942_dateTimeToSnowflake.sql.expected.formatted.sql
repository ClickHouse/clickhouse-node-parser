SELECT dateTimeToSnowflake();

SELECT dateTime64ToSnowflake();

SELECT dateTimeToSnowflake('abc');

SELECT dateTime64ToSnowflake('abc');

SELECT dateTimeToSnowflake('abc', 123);

SELECT dateTime64ToSnowflake('abc', 123);

SELECT dateTimeToSnowflake(now())
SETTINGS allow_deprecated_snowflake_conversion_functions = 0;

SELECT dateTime64ToSnowflake(now64())
SETTINGS allow_deprecated_snowflake_conversion_functions = 0;

SELECT '-- const / non-const inputs';