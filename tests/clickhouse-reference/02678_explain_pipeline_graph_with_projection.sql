CREATE TABLE t1(ID UInt64, name String) engine=MergeTree order by ID;
insert into t1(ID, name) values (1, 'abc'), (2, 'bbb');
