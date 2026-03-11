select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mem';
select columns_descriptions_cache_size from system.tables where database = currentDatabase() and table = 't_mt';
-- system.metrics
select value > 0 from system.metrics where metric = 'ColumnsDescriptionsCacheSize';
