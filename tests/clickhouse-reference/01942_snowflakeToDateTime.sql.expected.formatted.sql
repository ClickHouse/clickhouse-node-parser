SELECT snowflakeToDateTime();

SELECT snowflakeToDateTime64();

SELECT snowflakeToDateTime('abc');

SELECT snowflakeToDateTime64('abc');

SELECT snowflakeToDateTime('abc', 123);

SELECT snowflakeToDateTime64('abc', 123);

SELECT snowflakeToDateTime(123::Int64)
SETTINGS allow_deprecated_snowflake_conversion_functions = 0;

SELECT snowflakeToDateTime64(123::Int64)
SETTINGS allow_deprecated_snowflake_conversion_functions = 0;

SELECT 1
FROM tab
WHERE snowflakeToDateTime(42::Int64, tz) != now()
SETTINGS allow_nonconst_timezone_arguments = 1;

SELECT 1
FROM tab
WHERE snowflakeToDateTime64(42::Int64, tz) != now()
SETTINGS allow_nonconst_timezone_arguments = 1;