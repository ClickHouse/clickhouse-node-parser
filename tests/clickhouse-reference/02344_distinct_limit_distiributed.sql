create table t_distinct_limit (d Date, id Int64)
engine = MergeTree partition by toYYYYMM(d) order by d SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
set max_threads = 10;
set max_block_size = 1024;
select id from
(
    select distinct id from remote('127.0.0.1,127.0.0.2', currentDatabase(),t_distinct_limit) limit 10
)
order by id;
