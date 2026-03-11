select JSONExtract('{"a": "123", "b": 456, "c": [7, 8, 9]}', 'Tuple(a String, b String, c String)');
select JSONExtractString('{"a": 123}', 'a');
select JSONExtractString('{"a": "123"}', 'a');
select JSONExtractString('{"a": null}', 'a');
