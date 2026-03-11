SELECT *
FROM format(JSONEachRow, 'arr String', '{"arr" : [1, "Hello", [1,2,3]]}');