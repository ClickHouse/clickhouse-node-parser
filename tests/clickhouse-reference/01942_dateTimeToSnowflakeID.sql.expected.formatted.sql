SET session_timezone = 'UTC'; -- disable timezone randomization

SET enable_analyzer = 1; -- The old path formats the result with different whitespaces

SET output_format_pretty_single_large_number_tip_threshold = 0;

SELECT '-- Negative tests';

SELECT dateTimeToSnowflakeID(); -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dateTime64ToSnowflakeID(); -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dateTimeToSnowflakeID('invalid_dt'); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dateTime64ToSnowflakeID('invalid_dt'); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dateTimeToSnowflakeID(now(), 'invalid_epoch'); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dateTime64ToSnowflakeID(now64(), 'invalid_epoch'); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT dateTimeToSnowflakeID(now(), 42, 'too_many_args'); -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT dateTime64ToSnowflakeID(now64(), 42, 'too_many_args'); -- {serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH}

SELECT toTypeName(dateTimeToSnowflakeID(now()));

SELECT toTypeName(dateTime64ToSnowflakeID(now64()));