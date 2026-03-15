create table json(a int, b int default 7, c default a + b) engine File(JSONEachRow, 'data1622.json');
set input_format_defaults_for_omitted_fields = 1;
select * from json;
