create table per_table_ttl_02265 (key Int, date Date, value String) engine=MergeTree() order by key;
insert into per_table_ttl_02265 values (1, today(), '1');
select count() from system.mutations where database = currentDatabase() and table = 'per_table_ttl_02265';
