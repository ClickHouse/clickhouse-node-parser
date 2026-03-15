create table test (map Map(String, DateTime)) engine=Memory;
set date_time_input_format='best_effort';
select * from test;
