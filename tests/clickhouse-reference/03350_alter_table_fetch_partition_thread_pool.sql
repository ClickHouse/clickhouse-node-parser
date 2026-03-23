create table data1 (key Int) engine=ReplicatedMergeTree('/tables/{database}/{table}', 'r1') order by ();
create table data2 (key Int) engine=ReplicatedMergeTree('/tables/{database}/{table}', 'r1') order by ();
insert into data1 select * from numbers(100) settings max_block_size=1, min_insert_block_size_rows=1;
select 'parts in data1', count() from system.parts where database = currentDatabase() and table = 'data1';
select 'detached parts in data2', count() from system.detached_parts where database = currentDatabase() and table = 'data2';
select 'FETCH PARTITION uses multiple threads', peak_threads_usage>10 from system.query_log where event_date >= yesterday() and type != 'QueryStart' and query_kind = 'Alter' and current_database = currentDatabase();
