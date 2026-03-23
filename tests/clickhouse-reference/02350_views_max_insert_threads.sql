create table t (a UInt64) Engine = Null;
create materialized view t_mv Engine = Null AS select now() as ts, max(a) from t group by ts;
insert into t select * from numbers_mt(10e6)
settings max_threads=10,
         max_insert_threads=10,
         max_block_size=100000,
         parallel_view_processing=1,
         use_concurrency_control=0;
select peak_threads_usage>=10 from system.query_log where
    event_date >= yesterday() and
    current_database = currentDatabase() and
    type = 'QueryFinish' and
    startsWith(query, 'insert');
