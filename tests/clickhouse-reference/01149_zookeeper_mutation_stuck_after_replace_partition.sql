-- Tags: zookeeper

SET insert_keeper_fault_injection_probability=0; -- disable fault injection; part ids are non-deterministic in case of insert retries
set send_logs_level='error';
create table mt (n UInt64, s String) engine = MergeTree partition by intDiv(n, 10) order by n;
create table rmt (n UInt64, s String) engine = ReplicatedMergeTree('/clickhouse/test_01149_{database}/rmt', 'r1') partition by intDiv(n, 10) order by n;
select * from rmt;
select * from mt;
select table, partition_id, name, rows from system.parts where database=currentDatabase() and table in ('mt', 'rmt') and active=1 order by table, name;
SET mutations_sync = 1;
select mutation_id, command, parts_to_do_names, parts_to_do, is_done from system.mutations where database=currentDatabase() and table='rmt';
set replication_alter_partitions_sync=0;
set replication_alter_partitions_sync=1;
