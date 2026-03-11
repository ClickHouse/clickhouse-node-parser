select * from mt_compact order by a limit 10;
select distinct part_type from system.parts where database = currentDatabase() and table = 'mt_compact' and active;
select part_type, count() from system.parts where database = currentDatabase() and table = 'mt_compact' and active group by part_type order by part_type;
select * from mt_compact order by a, s limit 10;
select * from mt_compact where a > 1 order by a, s limit 10;
