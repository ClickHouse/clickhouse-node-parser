DESCRIBE TABLE format(JSONEachRow, '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
');

DESCRIBE TABLE format(JSONEachRow, 'a String, b Int64', '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
');

SELECT *
FROM format(JSONEachRow, 'a String, b Int64', '
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
{"a": "Hello", "b": 111}
{"a": "World", "b": 123}
');

DESCRIBE TABLE format(CSV, '1,2,"[1,2,3]","[[''abc''], [], [''d'', ''e'']]"');

DESCRIBE TABLE format(CSV, 'a1 Int32, a2 UInt64, a3 Array(Int32), a4 Array(Array(String))', '1,2,"[1,2,3]","[[''abc''], [], [''d'', ''e'']]"');

SELECT *
FROM format(CSV, '1,2,"[1,2,3]","[[''abc''], [], [''d'', ''e'']]"');

SELECT *
FROM format(CSV, 'a1 Int32, a2 UInt64, a3 Array(Int32), a4 Array(Array(String))', '1,2,"[1,2,3]","[[''abc''], [], [''d'', ''e'']]"');

DROP TABLE IF EXISTS test;

CREATE TABLE test AS format(TSV, 'cust_id UInt128', '20210129005809043707\n123456789\n987654321');

SELECT *
FROM test;

DESCRIBE TABLE test;

DROP TABLE test;