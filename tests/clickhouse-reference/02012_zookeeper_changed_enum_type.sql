-- Tags: zookeeper, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards

create table enum_alter_issue (a Enum8('one' = 1, 'two' = 2), b Int)
engine = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02012/enum_alter_issue', 'r1')
ORDER BY a;
insert into enum_alter_issue values ('one', 1), ('two', 2);
insert into enum_alter_issue values ('one', 3), ('two', 4);
select * from enum_alter_issue order by b;
