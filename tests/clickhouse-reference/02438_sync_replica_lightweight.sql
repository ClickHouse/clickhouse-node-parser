select type, new_part_name from system.replication_queue where database=currentDatabase() and table='rmt2' order by new_part_name;
select 1, n, _part from rmt1 order by n;
select 2, n, _part from rmt2 order by n;
select 3, n, _part from rmt1 order by n;
select 4, n from rmt2 order by n;
select 5, n, _part from rmt1 order by n;
select 6, n, _part from rmt2 order by n;
