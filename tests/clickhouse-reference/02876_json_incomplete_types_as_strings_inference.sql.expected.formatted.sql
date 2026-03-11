SELECT *
FROM format(JSONEachRow, '{"a" : null, "b" : {}, "c" : []}');

SELECT *
FROM format(JSONEachRow, '{"a" : {"b" : null, "c" : [[], []]}, "d" : {"e" : [{}, {}], "f" : null}}');