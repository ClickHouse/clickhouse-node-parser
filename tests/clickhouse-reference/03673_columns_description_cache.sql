create table t_mem (key Int) engine=Memory();
insert into t_mem values (1);
select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mem';
-- { echoOn }
create table t_mt (key Int) engine=MergeTree() order by ();
select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mt';
insert into t_mt values (1);
insert into t_mt values (2);
insert into t_mt values (10, '10');
insert into t_mt values (20, '20');
-- system.metrics
select value > 0 from system.metrics where metric = 'ColumnsDescriptionsCacheSize';
