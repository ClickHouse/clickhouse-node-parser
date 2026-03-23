-- Tags: no-parallel-replicas, no-object-storage

set min_bytes_to_use_direct_io = 0;
drop table if exists 03595_data;
create table 03595_data (key UInt32, val String) engine = MergeTree order by key
as
select number, 'val-' || number from numbers(100000);
select * from 03595_data
format Null
settings
    local_filesystem_read_method = 'pread_threadpool',
    min_bytes_to_use_direct_io = 1,
    log_query_threads = 1,
    use_uncompressed_cache = 0;
drop table 03595_data;
