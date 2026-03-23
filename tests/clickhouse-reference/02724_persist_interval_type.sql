create table saved_intervals_tmp Engine=Memory as SELECT number as EventID, toIntervalSecond(number+1) as v1, toIntervalHour(number+2) as v2, toIntervalNanosecond(number+3) as v3 from numbers(2);
create table saved_intervals_mgt Engine=MergeTree() ORDER BY EventID as SELECT number as EventID, toIntervalSecond(number+1) as v1, toIntervalHour(number+2) as v2, toIntervalNanosecond(number+3) as v3 from numbers(2);
CREATE table t1 (v1 IntervalMinute) ENGINE = Memory;
INSERT INTO t1 with toDateTime64('2023-01-01 00:00:00.000000001', 9, 'US/Eastern') as c SELECT EXTRACT(MINUTE FROM c+toIntervalSecond(number * 60)) from numbers(2);
select * from t1;
