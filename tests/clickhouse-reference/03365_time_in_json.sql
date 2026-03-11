SELECT json.time_value, json.id FROM json_time_test ORDER BY json.id;
SELECT json.time_value, json.id FROM json_time64_test ORDER BY json.id;
SELECT json.`metric.moving_time`, json.id FROM json_splits ORDER BY json.id;
