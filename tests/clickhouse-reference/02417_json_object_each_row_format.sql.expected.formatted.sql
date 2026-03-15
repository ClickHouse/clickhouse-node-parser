-- Tags: no-parallel, no-fasttest
SET input_format_json_try_infer_numbers_from_strings = 1;

SELECT
    number,
    'Hello' AS str,
    range(number) AS arr
FROM numbers(3)
FORMAT JSONObjectEachRow;

SELECT *
FROM file(`02417_data`.jsonObjectEachRow);