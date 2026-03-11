SELECT my.json.a
FROM test
SETTINGS enable_analyzer = 1;

SELECT `my.json`.a
FROM test
SETTINGS enable_analyzer = 1;

SELECT my.json.a
FROM test
SETTINGS enable_analyzer = 0;

SELECT `my.json`.a
FROM test
SETTINGS enable_analyzer = 0;

SELECT `t.t`.a
FROM format(JSONEachRow, '`t.t` Tuple(a UInt32)', '{"t.t" : {"a" : 42}}');

SELECT *
FROM test;

SELECT *
FROM test
ORDER BY my.json.a ASC;

SELECT *
FROM test
ORDER BY my.json.b::Int32 ASC;

SELECT *
FROM test
ORDER BY my.tuple.a ASC;