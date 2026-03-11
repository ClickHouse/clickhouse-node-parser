-- no rows, since no active monitor
select * from system.distribution_queue where database = currentDatabase();
select is_blocked, error_count, data_files, data_compressed_bytes>100, broken_data_files, broken_data_compressed_bytes from system.distribution_queue where database = currentDatabase();
select is_blocked, error_count, data_files, data_compressed_bytes, broken_data_files, broken_data_compressed_bytes from system.distribution_queue where database = currentDatabase();
