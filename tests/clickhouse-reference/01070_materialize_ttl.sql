-- Tags: no-parallel

SET allow_suspicious_ttl_expressions = 1;
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d);
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 1);
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 2);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 3);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 4);
set materialize_ttl_after_modify = 0;
-- TTL should not be applied
select * from ttl order by a;
create table ttl (i Int, s String) engine = MergeTree order by i;
insert into ttl values (1, 'a') (2, 'b') (3, 'c') (4, 'd');
select * from ttl order by i;
create table ttl (d Date, i Int, s String) engine = MergeTree order by i;
insert into ttl values (toDate('2000-01-02'), 1, 'a') (toDate('2000-01-03'), 2, 'b') (toDate('2080-01-01'), 3, 'c') (toDate('2080-01-03'), 4, 'd');
select i, s from ttl order by i;
