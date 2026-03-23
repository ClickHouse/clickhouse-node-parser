-- Tags: no-parallel

set mutations_sync = 2;
-- system.parts has server default, timezone cannot be randomized
set session_timezone = '';
SET allow_suspicious_ttl_expressions = 1;
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d)
SETTINGS max_number_of_merges_with_ttl_in_pool=0,materialize_ttl_recalculate_only=true;
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 1);
insert into ttl values (toDateTime('2000-10-10 00:00:00'), 2);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 3);
insert into ttl values (toDateTime('2100-10-10 00:00:00'), 4);
select * from ttl order by a;
select delete_ttl_info_min, delete_ttl_info_max  from system.parts where database = currentDatabase() and table = 'ttl' and active > 0 order by name asc;
create table ttl (i Int, s String) engine = MergeTree order by i
SETTINGS max_number_of_merges_with_ttl_in_pool=0,materialize_ttl_recalculate_only=true;
insert into ttl values (1, 'a') (2, 'b') (3, 'c') (4, 'd');
select * from ttl order by i;
select delete_ttl_info_min, delete_ttl_info_max  from system.parts where database = currentDatabase() and table = 'ttl' and active > 0;
create table ttl (d Date, i Int, s String) engine = MergeTree order by i
SETTINGS max_number_of_merges_with_ttl_in_pool=0,materialize_ttl_recalculate_only=true;
insert into ttl values (toDate('2000-01-02'), 1, 'a') (toDate('2000-01-03'), 2, 'b') (toDate('2080-01-01'), 3, 'c') (toDate('2080-01-03'), 4, 'd');
select i, s from ttl order by i;
create table ttl (i Int, s String, t String) engine = MergeTree order by i
SETTINGS max_number_of_merges_with_ttl_in_pool=0,materialize_ttl_recalculate_only=true;
insert into ttl values (1, 'a', 'aa') (2, 'b', 'bb') (3, 'c', 'cc') (4, 'd', 'dd');
select i, s, t from ttl order by i;
-- MATERIALIZE TTL ran only once
select count() from system.mutations where database = currentDatabase() and table = 'ttl' and is_done;
-- Nothing changed, don't run mutation
create table ttl (i Int, s String ttl toDate('2000-01-02')) engine = MergeTree order by i
SETTINGS max_number_of_merges_with_ttl_in_pool=0,materialize_ttl_recalculate_only=true;
