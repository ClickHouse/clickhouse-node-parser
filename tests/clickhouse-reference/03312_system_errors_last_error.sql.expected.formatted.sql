SELECT throwIf(1);

SELECT
    last_error_message,
    last_error_format_string
FROM `system`.errors
WHERE name = 'FUNCTION_THROW_IF_VALUE_IS_NON_ZERO'
    AND last_error_time > now() - 10
    AND NOT remote;