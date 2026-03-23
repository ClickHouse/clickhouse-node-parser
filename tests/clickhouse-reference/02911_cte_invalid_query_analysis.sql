create table t0 (pkey UInt32, c1 UInt32, primary key(pkey)) engine = MergeTree;
create table t1 (vkey UInt32, primary key(vkey)) engine = MergeTree;
create table t3 (c17 String, primary key(c17)) engine = MergeTree;
insert into t1 values (3);
