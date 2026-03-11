SELECT COUNT() FROM merge_table_standard_delete;
SELECT '-----lightweight mutation type-----';
SELECT command, is_done FROM system.mutations WHERE database = currentDatabase() AND table = 't_light';
select count(*) from t_light;
select * from t_light order by a;
select table, partition, name, rows from system.parts where database = currentDatabase() AND active and table ='t_light' order by name;
select table, partition, name, rows from system.parts where database = currentDatabase() AND active and table ='t_light' and rows > 0 order by name;
SELECT * FROM t_large WHERE a in (1,1000,1005,50000) order by a;
SELECT avg(a), avg(b), count() FROM t_proj;
