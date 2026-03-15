CREATE TABLE requests (
    event_time DateTime,
    event_date Date MATERIALIZED toDate(event_time),
    event_tm DateTime ALIAS event_time
) ENGINE = MergeTree ORDER BY (event_time);
select * from requests where event_date > '2000-01-01';
select * from requests as t where t.event_date > '2000-01-01';
select * from requests as "t" where "t".event_date > '2000-01-01';
select * from requests as t where t.event_tm > toDate('2000-01-01');
select * from requests as `t` where `t`.event_tm > toDate('2000-01-01');
