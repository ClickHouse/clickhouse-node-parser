SELECT '--JSONExtractCaseInsensitive--';

SELECT JSONExtractStringCaseInsensitive('{"ABC": "def"}', 'abc');

SELECT JSONExtractStringCaseInsensitive('{"abc": "def", "ABC": "ghi"}', 'abc');

SELECT JSONExtractIntCaseInsensitive('{"Value": 123}', 'value');

SELECT JSONExtractIntCaseInsensitive('{"VALUE": -456}', 'Value');

SELECT JSONExtractUIntCaseInsensitive('{"COUNT": 789}', 'count');

SELECT JSONExtractFloatCaseInsensitive('{"Price": 12.34}', 'PRICE');

SELECT JSONExtractBoolCaseInsensitive('{"IsActive": true}', 'isactive');

SELECT JSONExtractStringCaseInsensitive('{"User": {"Name": "John"}}', 'user', 'name');

SELECT JSONExtractIntCaseInsensitive('{"DATA": {"COUNT": 42}}', 'data', 'Count');

SELECT JSONExtractIntCaseInsensitive('{"Items": [1, 2, 3]}', 'items', 1);

SELECT JSONExtractStringCaseInsensitive('{"TAGS": ["a", "b", "c"]}', 'tags', 0);

SELECT JSONExtractRawCaseInsensitive('{"Object": {"key": "value"}}', 'OBJECT');

SELECT JSONExtractRawCaseInsensitive('{"Array": [1, 2, 3]}', 'array');

SELECT JSONExtractCaseInsensitive('{"Number": 123}', 'number', 'Int32');

SELECT JSONExtractCaseInsensitive('{"Text": "hello"}', 'TEXT', 'String');

SELECT JSONExtractCaseInsensitive('{"List": [1, 2, 3]}', 'list', 'Array(Int32)');

SELECT JSONExtractKeysAndValuesCaseInsensitive('{"Name": "Alice", "AGE": 30}', 'String');

SELECT JSONExtractKeysAndValuesCaseInsensitive('{"ID": 1, "Value": 2}', 'Int32');

SELECT JSONExtractStringCaseInsensitive('{"abc": "def"}', 'xyz');

SELECT JSONExtractIntCaseInsensitive('{"abc": 123}', 'XYZ');

SELECT JSONExtractStringCaseInsensitive('{}', 'key');

SELECT JSONExtractStringCaseInsensitive('{"key": "first", "KEY": "second", "Key": "third"}', 'KEY');

SELECT JSONExtractIntCaseInsensitive('{"LEVEL1": {"Level2": {"level3": 999}}}', 'level1', 'LEVEL2', 'LEVEL3');

SELECT JSONExtractArrayRawCaseInsensitive('{"Items": [1, 2, 3]}', 'ITEMS');

SELECT JSONExtractKeysAndValuesRawCaseInsensitive('{"Name": "Alice", "AGE": 30}');

SELECT JSONExtractKeysCaseInsensitive('{"Name": "Alice", "AGE": 30}');