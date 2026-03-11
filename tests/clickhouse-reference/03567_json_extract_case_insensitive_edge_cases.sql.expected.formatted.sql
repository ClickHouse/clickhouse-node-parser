SELECT '--Edge cases for JSONExtractCaseInsensitive--';

SELECT JSONExtractStringCaseInsensitive('{"key-with-dash": "value1"}', 'KEY-WITH-DASH');

SELECT JSONExtractStringCaseInsensitive('{"key_with_underscore": "value2"}', 'KEY_WITH_UNDERSCORE');

SELECT JSONExtractStringCaseInsensitive('{"key.with.dots": "value3"}', 'KEY.WITH.DOTS');

SELECT JSONExtractStringCaseInsensitive('{"key with spaces": "value4"}', 'KEY WITH SPACES');

SELECT JSONExtractStringCaseInsensitive('{"café": "coffee"}', 'CAFÉ');

SELECT JSONExtractStringCaseInsensitive('{"123": "numeric key"}', '123');

SELECT JSONExtractStringCaseInsensitive('{"": "empty key"}', '');

SELECT JSONExtractStringCaseInsensitive(concat('{"', repeat('VeryLongKey', 100), '": "value"}'), repeat('verylongkey', 100));

SELECT JSONExtractStringCaseInsensitive('{"Key": 123}', 'key');

SELECT JSONExtractStringCaseInsensitive('{"Key": true}', 'KEY');

SELECT JSONExtractIntCaseInsensitive('{"Key": "123"}', 'key');

SELECT JSONExtractBoolCaseInsensitive('{"Key": 1}', 'KEY');

SELECT JSONExtractStringCaseInsensitive('{"Key": null}', 'key');

SELECT JSONExtractIntCaseInsensitive('{"Key": null}', 'KEY');

SELECT JSONExtractStringCaseInsensitive('not a json', 'key');

SELECT JSONExtractIntCaseInsensitive('{invalid json}', 'key');

SELECT JSONExtractString('{"ABC": "def", "abc": "ghi"}', 'abc');

SELECT JSONExtractStringCaseInsensitive('{"ABC": "def", "abc": "ghi"}', 'abc');

SELECT JSONExtractStringCaseInsensitive('{"LEVEL1": {"level2": {"LEVEL3": {"level4": "deep"}}}}', 'level1', 'LEVEL2', 'level3', 'LEVEL4');

SELECT JSONExtractArrayRawCaseInsensitive('{"ARRAY": ["test", 123, true]}', 'array');

SELECT length(JSONExtractKeysAndValuesRawCaseInsensitive('{"KEY1": "value1", "key2": 100}'));

SELECT JSONExtractKeysCaseInsensitive('{"ABC": 1, "def": 2, "GHI": 3}')[1];