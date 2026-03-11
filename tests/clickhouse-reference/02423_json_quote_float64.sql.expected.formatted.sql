SELECT
    42424.4242424242::Float64 AS x,
    [42.42::Float64, 42.42::Float64] AS arr,
    tuple(42.42::Float64) AS tuple
FORMAT JSONEachRow
SETTINGS output_format_json_quote_64bit_floats = 1;

SELECT
    42424.4242424242::Float64 AS x,
    [42.42::Float64, 42.42::Float64] AS arr,
    tuple(42.42::Float64) AS tuple
FORMAT JSONEachRow
SETTINGS output_format_json_quote_64bit_floats = 0;