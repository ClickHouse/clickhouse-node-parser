create table t_mem (key Int) engine=Memory();
select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mem';
-- { echoOn }
create table t_mt (key Int) engine=MergeTree() order by ();
select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mt';
-- system.metrics
select value > 0 from system.metrics where metric = 'ColumnsDescriptionsCacheSize';
