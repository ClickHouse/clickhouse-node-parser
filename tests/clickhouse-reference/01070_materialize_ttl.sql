-- Tags: no-parallel

SET allow_suspicious_ttl_expressions = 1;
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d);
set materialize_ttl_after_modify = 0;
-- TTL should not be applied
select * from ttl order by a;
create table ttl (i Int, s String) engine = MergeTree order by i;
select * from ttl order by i;
create table ttl (d Date, i Int, s String) engine = MergeTree order by i;
select i, s from ttl order by i;
