-- Possible crash in case of mutations contains subquery, that will use
-- InterpreterSelectQuery() with only_analyze=true, which uses
-- getStorageSnapshotWithoutData(), and may crash in
-- getConditionSelectivityEstimator() since parts was nullptr

drop table if exists t0;
drop table if exists t1;
create table t0 (key Int) engine=MergeTree order by () settings auto_statistics_types='';
create table t1 (key Int) engine=MergeTree order by () settings auto_statistics_types='';
insert into t0 values (1);
insert into t1 values (1);
