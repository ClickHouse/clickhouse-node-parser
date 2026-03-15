SET session_timezone = 'UTC';

SET cast_string_to_date_time_mode = 'basic';

SELECT '2020-02-01 20:00:00'::DateTime;

SELECT '2020-02-01 20:00:00Z'::DateTime; -- {serverError CANNOT_PARSE_TEXT}

SELECT '01-02-2020 20:00:00Z'::DateTime; -- {serverError CANNOT_PARSE_TEXT}

SET cast_string_to_date_time_mode = 'best_effort';

SET cast_string_to_date_time_mode = 'best_effort_us';