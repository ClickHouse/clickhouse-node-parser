-- Tags: no-parallel

SET allow_suspicious_ttl_expressions = 1;
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d);
set mutations_sync = 2;
select * from ttl order by a;
create table ttl (i Int, s String) engine = MergeTree order by i;
select * from ttl order by i;
create table ttl (d Date, i Int, s String) engine = MergeTree order by i;
select i, s from ttl order by i;
create table ttl (i Int, s String, t String) engine = MergeTree order by i;
select i, s, t from ttl order by i;
-- MATERIALIZE TTL ran only once
select count() from system.mutations where database = currentDatabase() and table = 'ttl' and is_done;
-- Nothing changed, don't run mutation
create table ttl (i Int, s String ttl toDate('2000-01-02')) engine = MergeTree order by i;
