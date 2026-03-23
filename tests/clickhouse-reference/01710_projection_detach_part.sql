set optimize_use_projections = 1;
create table t (i int, j int, projection x (select * order by j)) engine MergeTree partition by i order by i;
insert into t values (1, 2);
select count() from system.projection_parts where database = currentDatabase() and table = 't' and active;
