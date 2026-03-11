select * from requests where event_date > '2000-01-01';
select * from requests as t where t.event_date > '2000-01-01';
select * from requests as "t" where "t".event_date > '2000-01-01';
select * from requests as t where t.event_tm > toDate('2000-01-01');
select * from requests as `t` where `t`.event_tm > toDate('2000-01-01');
