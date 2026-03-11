-- { echo }
-- 25 is the size of marks in case constant index granularity
select count() from test_materialize;
select partition_id, rows, index_granularity_bytes_in_memory_allocated>25 from system.parts where database = currentDatabase() and table = 'test_materialize' and active order by 1;
select partition_id, rows, index_granularity_bytes_in_memory_allocated from system.parts where database = currentDatabase() and table = 'test_materialize' and active order by 1;
select * from system.mutations where database = currentDatabase() and not is_done format Vertical;
