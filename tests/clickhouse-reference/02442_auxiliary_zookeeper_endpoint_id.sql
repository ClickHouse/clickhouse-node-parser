create table t1_r1 (x Int32) engine=ReplicatedMergeTree('/test/02442/{database}/t', 'r1') order by x;
create table t1_r2 (x Int32) engine=ReplicatedMergeTree('/test/02442/{database}/t', 'r2') order by x;
-- create table with same replica_path as t1_r1
create table t2 (x Int32) engine=ReplicatedMergeTree('zookeeper2:/test/02442/{database}/t', 'r1') order by x;
select count() from t1_r2;
