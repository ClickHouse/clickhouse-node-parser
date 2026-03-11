SELECT *
FROM format(JSONEachRow, '{"x" : 123}\n{"x" : "str"}');

SELECT *
FROM format(JSONEachRow, '{"x" : [123, "str"]}');

SELECT *
FROM format(JSONEachRow, '{"x" : [123, "456"]}\n{"x" : ["str", "rts"]}');