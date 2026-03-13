-- { echo }
--- ensure that input_format_null_as_default allow writes to Nullable columns too
SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login Nullable(String))))', '{"payload" : {"pull_request": {"merged_by": {"login": "root"}}}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login Nullable(String))))', '{"payload" : {"pull_request": {"merged_by": null}}}')
SETTINGS input_format_null_as_default = 1;

--- tuple
SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {"pull_request": {"merged_by": {"login": "root"}}}}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {"pull_request": {"merged_by": {"login": "root"}}}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {}}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {"pull_request": {"merged_by": null}}}')
SETTINGS input_format_null_as_default = 0; -- { serverError CANNOT_PARSE_INPUT_ASSERTION_FAILED }

SELECT *
FROM format(JSONEachRow, 'payload Tuple(pull_request Tuple(merged_by Tuple(login String)))', '{"payload" : {"pull_request": {"merged_by": null}}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, '{"payload" : {"pull_request": {"merged_by": {"login": "root"}}}}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, '{"payload" : {"pull_request": {"merged_by": {"login": "root"}}}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Map(String, String)', '{"payload" : {}}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, 'payload Map(String, String)', '{"payload" : {}}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Map(String, Map(String, Map(String, String)))', '{"payload" : {"pull_request": {"merged_by": null}}}')
SETTINGS input_format_null_as_default = 0; -- { serverError CANNOT_PARSE_INPUT_ASSERTION_FAILED }

SELECT *
FROM format(JSONEachRow, 'payload Map(String, Map(String, Map(String, String)))', '{"payload" : {"pull_request": {"merged_by": null}}}')
SETTINGS input_format_null_as_default = 1;

--- array
SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : ["root"]}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : ["root"]}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : []}')
SETTINGS input_format_null_as_default = 0;

SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : []}')
SETTINGS input_format_null_as_default = 1;

SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : null}')
SETTINGS input_format_null_as_default = 0; -- { serverError CANNOT_READ_ARRAY_FROM_TEXT }

SELECT *
FROM format(JSONEachRow, 'payload Array(String)', '{"payload" : null}')
SETTINGS input_format_null_as_default = 1;