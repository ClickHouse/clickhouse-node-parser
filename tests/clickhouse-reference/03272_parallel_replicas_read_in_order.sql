SELECT * from read_in_order_with_parallel_replicas ORDER BY id desc limit 1;
SELECT * from read_in_order_with_parallel_replicas ORDER BY id limit 1;
SELECT * from read_in_order_with_parallel_replicas ORDER BY id desc limit 1
SETTINGS max_threads=1, log_comment='test read in order desc with parallel replicas';
SELECT * from read_in_order_with_parallel_replicas ORDER BY id limit 1
SETTINGS max_threads=1, log_comment='test read in order asc with parallel replicas';
select count(1) from system.query_log where current_database = currentDatabase() AND log_comment = 'test read in order desc with parallel replicas' and read_rows>2;
select count(1) from system.query_log where current_database = currentDatabase() AND log_comment = 'test read in order asc with parallel replicas' and read_rows>2;
