SELECT number
FROM numbers(5)
SETTINGS output_format_json_array_of_rows = 1
FORMAT JSONEachRow;

SELECT number
FROM numbers(5)
FORMAT JSONEachRow
SETTINGS output_format_json_array_of_rows = 1;