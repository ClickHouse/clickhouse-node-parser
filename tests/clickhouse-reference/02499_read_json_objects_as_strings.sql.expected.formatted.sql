SELECT *
FROM format(JSONEachRow, '{"x" : "abc"}, {"x" : {"a" : 10, "b" : "abc"}}');

SELECT *
FROM format(JSONEachRow, '{"x" : {"a" : "b"}}, {"x" : {"a" : 1, "b" : [1,2,3]}}');