-- Error cases
SELECT dateTimeToSnowflake();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT dateTime64ToSnowflake();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT dateTimeToSnowflake('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT dateTime64ToSnowflake('abc');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT dateTimeToSnowflake('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT dateTime64ToSnowflake('abc', 123);  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT dateTimeToSnowflake(now()) SETTINGS allow_deprecated_snowflake_conversion_functions = 0; -- { serverError DEPRECATED_FUNCTION }
SELECT dateTime64ToSnowflake(now64()) SETTINGS allow_deprecated_snowflake_conversion_functions = 0; -- { serverError DEPRECATED_FUNCTION }
SELECT '-- const / non-const inputs';
