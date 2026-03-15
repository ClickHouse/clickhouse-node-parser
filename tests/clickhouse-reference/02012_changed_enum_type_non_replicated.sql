-- Tags: replica

create table enum_alter_issue (a Enum8('one' = 1, 'two' = 2)) engine = MergeTree() ORDER BY a;
select * from enum_alter_issue order by a;
