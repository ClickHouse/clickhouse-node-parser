SET enable_analyzer = 1, max_threads = 1;
create table t1 (id UInt32, name String) engine=MergeTree order by id;
create table t2 (id UInt32, name String) engine=MergeTree order by id;
select * from t1 ORDER BY ALL;
select * from t2 ORDER BY ALL;
SELECT * FROM (select rowNumberInAllBlocks() + 1 as id, t1.id, t2.id from t1 left join t2 on t1.id=t2.id) ORDER BY ALL;
SELECT * FROM (select rowNumberInAllBlocks() + 1 as id, t1.id, t2.id, t1.name, t2.name from t1 left join t2 on t1.id=t2.id) ORDER BY ALL;
create table t3 engine=MergeTree order by id as
select rowNumberInAllBlocks() + 1 as id, t1.id, t2.id, t1.name, t2.name from t1 left join t2 on t1.id=t2.id;
SELECT * FROM t3 ORDER BY ALL;
