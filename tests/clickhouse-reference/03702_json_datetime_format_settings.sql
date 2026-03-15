-- Test that format settings are respected during internal CAST for JSON type
SET enable_json_type = 1;
-- Direct CAST should respect date_time_input_format setting
SELECT '{"d" : "2024 April 4"}'::JSON AS json, JSONAllPathsWithTypes(json) SETTINGS date_time_input_format = 'best_effort';
CREATE TABLE test_json_datetime (json JSON) ENGINE = Memory;
SELECT JSONAllPathsWithTypes(json) FROM test_json_datetime;
