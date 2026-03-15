create table ttl_00933_2 (d DateTime, a Int default 111 ttl d + interval 1 DAY) engine = MergeTree order by tuple() partition by toDayOfMonth(d);
select a from ttl_00933_2 order by a;
create table ttl_00933_2 (d DateTime, a Int, b default a * 2 ttl d + interval 1 DAY) engine = MergeTree order by tuple() partition by toDayOfMonth(d);
select a, b from ttl_00933_2 order by a;
create table ttl_00933_2 (d DateTime, a Int, b default 222 ttl d + interval 1 DAY) engine = MergeTree order by tuple() partition by toDayOfMonth(d);
