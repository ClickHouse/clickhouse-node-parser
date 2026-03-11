select table, name, type, expr, granularity from system.data_skipping_indices where database = currentDatabase() and table = 't_index';
select table, name, type, expr, granularity from system.data_skipping_indices where database = currentDatabase() and table = 't_index_replica';
