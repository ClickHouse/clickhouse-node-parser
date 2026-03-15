create table data_01279 (key String) Engine=TinyLog();
set max_rows_to_group_by=10;
set group_by_overflow_mode='any';
set group_by_two_level_threshold=100;
select * from data_01279 group by key format Null;
