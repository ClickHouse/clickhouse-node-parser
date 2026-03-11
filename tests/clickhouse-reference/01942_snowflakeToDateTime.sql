-- Error cases
SELECT snowflakeToDateTime();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT snowflakeToDateTime64();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT snowflakeToDateTime('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeToDateTime64('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeToDateTime('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeToDateTime64('abc', 123);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeToDateTime(123::Int64) SETTINGS allow_deprecated_snowflake_conversion_functions = 0; -- { serverError DEPRECATED_FUNCTION }
SELECT snowflakeToDateTime64(123::Int64) SETTINGS allow_deprecated_snowflake_conversion_functions = 0; -- { serverError DEPRECATED_FUNCTION }
SELECT 1 FROM tab WHERE snowflakeToDateTime(42::Int64, tz) != now() SETTINGS allow_nonconst_timezone_arguments = 1;
SELECT 1 FROM tab WHERE snowflakeToDateTime64(42::Int64, tz) != now() SETTINGS allow_nonconst_timezone_arguments = 1;
