-- Direct CAST should respect date_time_input_format setting
SELECT
    '{"d" : "2024 April 4"}'::JSON AS json,
    JSONAllPathsWithTypes(json)
SETTINGS date_time_input_format = 'best_effort';

SELECT JSONAllPathsWithTypes(json)
FROM test_json_datetime;