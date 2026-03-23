-- Tags: no-fasttest
SELECT *
FROM format(JSONEachRow, '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
');

SET max_block_size = 5;

SELECT *
FROM format(CSV, '1,2,"[1,2,3]","[[''abc''], [], [''d'', ''e'']]"');

DROP TABLE IF EXISTS test;

CREATE TABLE test AS format(JSONEachRow, '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "Hello", "b": 131}
{"a": "World", "b": 123}
');

SELECT *
FROM test;

DROP TABLE test;