select * from format(JSONEachRow, '{"x" : "abc"}, {"x" : {"a" : 10, "b" : "abc"}}');
select * from format(JSONEachRow, '{"x" : {"a" : "b"}}, {"x" : {"a" : 1, "b" : [1,2,3]}}');
