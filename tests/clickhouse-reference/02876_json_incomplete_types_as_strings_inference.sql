set input_format_json_infer_incomplete_types_as_strings=1;
select * from format(JSONEachRow, '{"a" : null, "b" : {}, "c" : []}');
select * from format(JSONEachRow, '{"a" : {"b" : null, "c" : [[], []]}, "d" : {"e" : [{}, {}], "f" : null}}');
