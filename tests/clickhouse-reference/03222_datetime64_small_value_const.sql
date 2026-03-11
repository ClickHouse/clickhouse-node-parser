select *, (select toDateTime64(0, 3)) from remote('127.0.0.1', system.one) settings prefer_localhost_replica=0;
select *, (select toDateTime64(5, 3)) from remote('127.0.0.1', system.one) settings prefer_localhost_replica=0;
select *, (select toDateTime64('1970-01-01 00:45:25.456789', 6)) from remote('127.0.0.1', system.one) settings prefer_localhost_replica=0;
select *, (select toDateTime64('1970-01-01 00:53:25.456789123', 9)) from remote('127.0.0.1', system.one) settings prefer_localhost_replica=0;
select *, (select toDateTime64(null,3)) from remote('127.0.0.1', system.one) settings prefer_localhost_replica=0;
--Output : 1,5 2,3,4 4 1,2,3,5 0 0 5
select id, dt from distr_03222_dt64 where dt = (select toDateTime64(0,3)) order by id;
select id, dt from distr_03222_dt64 where dt > (select toDateTime64(0,3)) order by id;
select id, dt from distr_03222_dt64 where dt > (select toDateTime64('1970-01-01 00:10:00.000',3)) order by id;
select id, dt from distr_03222_dt64 where dt < (select toDateTime64(5,3)) order by id;
select count(*) from distr_03222_dt64 where dt > (select toDateTime64('2024-07-20 00:00:00',3));
select count(*) from distr_03222_dt64 where dt > (select now());
select count(*) from distr_03222_dt64 where dt < (select toDateTime64('2004-07-20 00:00:00',3));
