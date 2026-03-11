SELECT *
FROM format(JSONEachRow, 'a Tuple(b UInt32)', '{"a" : {"b" : 1, "b" : 2}}');

SELECT *
FROM format(JSONEachRow, '{"a" : {"b" : 1, "b" : 2}}');

SELECT *
FROM format(JSONEachRow, '{"a" : {"b" : 1, "b" : 2, "b" : 3}, "c" : 42}');

SELECT *
FROM format(JSONEachRow, '{"a" : {"b" : 1, "b" : "Hello"}}');

SELECT *
FROM format(JSONEachRow, '{"a" : {"b" : 1, "b" : {"c" : "Hello"}}}');