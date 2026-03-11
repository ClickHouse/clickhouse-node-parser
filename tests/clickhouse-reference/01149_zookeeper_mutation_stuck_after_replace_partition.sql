select * from rmt;
select * from mt;
select table, partition_id, name, rows from system.parts where database=currentDatabase() and table in ('mt', 'rmt') and active=1 order by table, name;
select mutation_id, command, parts_to_do_names, parts_to_do, is_done from system.mutations where database=currentDatabase() and table='rmt';
