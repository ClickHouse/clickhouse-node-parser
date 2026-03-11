select * from tp_2 order by x;
select count() from system.projection_parts where database = currentDatabase() and table = 'tp_2' and name = 'pp' and active;
select * from system.projection_parts where database = currentDatabase() and table = 'tp_2' and name = 'pp' and active;
