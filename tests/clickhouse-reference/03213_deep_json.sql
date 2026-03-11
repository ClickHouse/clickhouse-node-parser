-- The default limit works.
SELECT * FROM format("JSONCompactEachRow", 'x UInt32, y UInt32', REPEAT('[1,1,', 100000)) SETTINGS input_format_json_compact_allow_variable_number_of_columns = 1; -- { serverError TOO_DEEP_RECURSION, INCORRECT_DATA }
