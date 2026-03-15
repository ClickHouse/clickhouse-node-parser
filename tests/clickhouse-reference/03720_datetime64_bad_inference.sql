set date_time_input_format='basic';
select * from format(JSONEachRow, '{"d" : "5981 10:01.000"}');
