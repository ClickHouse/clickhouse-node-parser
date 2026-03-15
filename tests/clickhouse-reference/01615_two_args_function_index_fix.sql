create table bad_date_time (time Datetime('Asia/Istanbul'), count UInt16) Engine = MergeTree() ORDER BY (time);
-- primary key analysis was wrong in previous versions and did not take the timezone argument into account, so empty result was given.
select toDate(time, 'UTC') dt, min(toDateTime(time, 'UTC')), max(toDateTime(time, 'UTC')), sum(count) from bad_date_time where toDate(time, 'UTC') = '2020-12-19' group by dt;
