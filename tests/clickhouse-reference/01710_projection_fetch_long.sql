create table tp_1 (x Int32, y Int32, projection p (select x, y order by x)) engine = ReplicatedMergeTree('/clickhouse/tables/{shard}/01710_projection_fetch_' || currentDatabase(), '1_{replica}') order by y settings min_rows_for_wide_part = 4, min_bytes_for_wide_part = 32;
create table tp_2 (x Int32, y Int32, projection p (select x, y order by x)) engine = ReplicatedMergeTree('/clickhouse/tables/{shard}/01710_projection_fetch_' || currentDatabase(), '2_{replica}') order by y settings min_rows_for_wide_part = 4, min_bytes_for_wide_part = 32;
select * from tp_2 order by x;
select count() from system.projection_parts where database = currentDatabase() and table = 'tp_2' and name = 'pp' and active;
-- all other three operations are mutations
set mutations_sync = 2;
select * from system.projection_parts where database = currentDatabase() and table = 'tp_2' and name = 'pp' and active;
