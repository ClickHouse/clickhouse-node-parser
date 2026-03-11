SELECT
    '1960-01-01' AS input,
    toDateOrNull('1960-01-01') AS result;

SELECT
    '1800-01-01' AS input,
    toDateOrNull('1800-01-01') AS result;

SELECT
    '3000-01-01' AS input,
    toDateOrNull('3000-01-01') AS result;

SELECT
    '1960-01-01 00:00:00' AS input,
    toDateTimeOrNull('1960-01-01 00:00:00') AS result;

SELECT
    '1800-01-01 00:00:00' AS input,
    toDateTimeOrNull('1800-01-01 00:00:00') AS result;

SELECT
    '3000-01-01 00:00:00' AS input,
    toDateTimeOrNull('3000-01-01 00:00:00') AS result;

SELECT
    '1800-01-01 00:00:00' AS input,
    toDateTime64OrNull('1800-01-01 00:00:00') AS result;

SELECT
    '3000-01-01 00:00:00' AS input,
    toDateTime64OrNull('3000-01-01 00:00:00') AS result;

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'Date') AS result;

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'Date') AS result;

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'Date') AS result;

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'DateTime') AS result;

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime') AS result;

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime') AS result;

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime64') AS result;

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime64') AS result;

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort';

SELECT
    '1960-01-01' AS input,
    accurateCastOrNull('1960-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';

SELECT
    '1800-01-01' AS input,
    accurateCastOrNull('1800-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';

SELECT
    '3000-01-01' AS input,
    accurateCastOrNull('3000-01-01', 'DateTime64') AS result
SETTINGS cast_string_to_date_time_mode = 'best_effort_us';