SET session_timezone = 'UTC'; -- disable timezone randomization
SET enable_analyzer = 1; -- The old path formats the result with different whitespaces
SET output_format_pretty_single_large_number_tip_threshold = 0;
SELECT '-- Negative tests';
SELECT snowflakeIDToDateTime();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT snowflakeIDToDateTime64();  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT snowflakeIDToDateTime('invalid_snowflake');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime64('invalid_snowflake');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime(123::UInt64, 'invalid_epoch');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime64(123::UInt64, 'invalid_epoch');  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime(123::UInt64, materialize(42));  -- {serverError ILLEGAL_COLUMN}
SELECT snowflakeIDToDateTime64(123::UInt64, materialize(42));  -- {serverError ILLEGAL_COLUMN}
SELECT snowflakeIDToDateTime(123::UInt64, 42, 42);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime64(123::UInt64, 42, 42);  -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT snowflakeIDToDateTime(123::UInt64, 42, 'UTC', 'too_many_args');  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT snowflakeIDToDateTime64(123::UInt64, 42, 'UTC', 'too_many_args');  -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}
SELECT toTypeName(snowflakeIDToDateTime(123::UInt64));
SELECT toTypeName(snowflakeIDToDateTime64(123::UInt64));
