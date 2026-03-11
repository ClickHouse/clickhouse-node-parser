select * from format(JSONEachRow, 'a Tuple(b UInt32)', '{"a" : {"b" : 1, "b" : 2}}'); -- {serverError INCORRECT_DATA}
select * from format(JSONEachRow, '{"a" : {"b" : 1, "b" : 2}}'); -- {serverError INCORRECT_DATA}
select * from format(JSONEachRow, '{"a" : {"b" : 1, "b" : 2, "b" : 3}, "c" : 42}'); -- {serverError INCORRECT_DATA}
select * from format(JSONEachRow, '{"a" : {"b" : 1, "b" : "Hello"}}'); -- {serverError INCORRECT_DATA}
select * from format(JSONEachRow, '{"a" : {"b" : 1, "b" : {"c" : "Hello"}}}'); -- {serverError INCORRECT_DATA}
