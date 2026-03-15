set mutations_sync = 2;
-- check that ttl info was updated after mutation.
create table ttl (i Int, a Int, s String) engine = MergeTree order by i;
select * from ttl order by i;
-- check that skip index is updated after column was modified by ttl.
create table ttl (i Int, a Int, s String default 'b' ttl a % 2 = 0 ? today() - 10 : toDate('2100-01-01'),
    index ind_s (s) type set(1) granularity 1) engine = MergeTree order by i;
select count() from ttl where s = 'a';
select count() from ttl where s = 'b';
-- check only that it doesn't throw exceptions.
SET allow_suspicious_ttl_expressions = 1;
create table ttl (i Int, s String) engine = MergeTree order by i ttl toDate('2000-01-01') TO DISK 'default';
create table ttl (a Int, b Int, c Int default 42 ttl d, d Date, index ind (b * c) type minmax granularity 1)
engine = MergeTree order by a;
select * from ttl;
