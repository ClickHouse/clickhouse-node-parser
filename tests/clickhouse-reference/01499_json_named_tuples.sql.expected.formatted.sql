SELECT *
FROM named_tuples
FORMAT JSONEachRow
SETTINGS output_format_json_named_tuples_as_objects = 1;