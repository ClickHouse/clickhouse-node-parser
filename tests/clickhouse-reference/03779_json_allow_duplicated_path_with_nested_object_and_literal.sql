select '{"a" : 42, "a" : {"b" : 42}}'::JSON as json, json.a, json.a.b, json.^a;
select '{"a" : {"b" : 42}, "a" : 42}'::JSON as json, json.a, json.a.b, json.^a;
select '{"a" : 42, "a" : {"b" : 42}, "a" : 42}'::JSON; -- {serverError INCORRECT_DATA}
select '{"a" : 42, "a" : {"b" : 42}, "a" : {"c" : 42}}'::JSON; -- {serverError INCORRECT_DATA}
