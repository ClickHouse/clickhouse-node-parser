set send_logs_level = 'fatal';
create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d) settings remove_empty_parts = 0;
select * from ttl order by d, a;
create table ttl (d Date, a Int) engine = MergeTree order by tuple() partition by toDayOfMonth(d) settings remove_empty_parts = 0;
