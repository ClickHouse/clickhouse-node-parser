-- Tags: zookeeper, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards

drop table if exists enum_alter_issue;
create table enum_alter_issue (a Enum16('one' = 1, 'two' = 2), b Int)
engine = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02012/enum_alter_issue', 'r2')
ORDER BY b;
insert into enum_alter_issue values ('one', 1), ('two', 1);
select * from enum_alter_issue;
drop table enum_alter_issue;
