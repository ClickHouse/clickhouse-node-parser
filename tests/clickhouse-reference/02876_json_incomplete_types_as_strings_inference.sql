select * from format(JSONEachRow, '{"a" : null, "b" : {}, "c" : []}');
select * from format(JSONEachRow, '{"a" : {"b" : null, "c" : [[], []]}, "d" : {"e" : [{}, {}], "f" : null}}');
