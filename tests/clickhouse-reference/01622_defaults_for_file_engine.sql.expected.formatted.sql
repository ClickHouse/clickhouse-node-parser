CREATE TABLE json
(
    a int,
    b int DEFAULT 7,
    c DEFAULT a + b
)
ENGINE = File(JSONEachRow, 'data1622.json');

SET input_format_defaults_for_omitted_fields = 1;

SELECT *
FROM json;