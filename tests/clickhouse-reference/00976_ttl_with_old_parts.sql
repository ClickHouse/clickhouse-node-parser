create table ttl (d Date, a Int) engine = MergeTree order by a partition by toDayOfMonth(d) settings remove_empty_parts = 0;
select sleep(1) format Null; -- wait if very fast merge happen
select * from ttl order by d, a;
