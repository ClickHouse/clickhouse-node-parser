SELECT JSONExtract('{"a": "123", "b": 456, "c": [7, 8, 9]}', 'Tuple(a String, b String, c String)');

SELECT JSONExtractString('{"a": 123}', 'a');

SELECT JSONExtractString('{"a": "123"}', 'a');

SELECT JSONExtractString('{"a": null}', 'a');