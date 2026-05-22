SELECT JSONExtract('{"a": "123", "b": 456, "c": [7, 8, 9]}', 'Tuple(a String, b String, c String)');

WITH '{"string_value":null}' AS json

SELECT JSONExtract(json, 'string_value', 'Nullable(String)');

WITH '{"string_value":null}' AS json

SELECT JSONExtract(json, 'string_value', 'LowCardinality(Nullable(String))');

SELECT JSONExtractString('{"a": 123}', 'a');

SELECT JSONExtractString('{"a": "123"}', 'a');

SELECT JSONExtractString('{"a": null}', 'a');