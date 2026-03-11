select * from projection_test; -- { serverError PROJECTION_NOT_USED }
select toStartOfMinute(datetime) dt_m, countIf(first_time = 0) from projection_test join (select 1) x on 1 where domain = '1' group by dt_m order by dt_m; -- { serverError PROJECTION_NOT_USED }
select toStartOfMinute(datetime) dt_m, countIf(first_time = 0) / count(), avg((kbytes * 8) / duration) from projection_test where domain = '1' group by dt_m order by dt_m;
-- prewhere with alias
select toStartOfMinute(datetime) dt_m, countIf(first_time = 0) / count(), avg((kbytes * 8) / duration) from projection_test prewhere domain_alias = 3 where domain = '1' group by dt_m order by dt_m;
-- prewhere with alias with row policy (non existing)
select toStartOfMinute(datetime) dt_m, countIf(first_time = 0) / count(), avg((kbytes * 8) / duration) from projection_test prewhere domain_alias = 1 where domain = '1' group by dt_m order by dt_m;
-- TODO There is a bug in row policy filter (not related to projections, crash in master)
-- drop row policy if exists filter on projection_test;
-- create row policy filter on projection_test using (domain != '1') to all;
-- prewhere with alias with row policy (existing)
-- select toStartOfMinute(datetime) dt_m, countIf(first_time = 0) / count(), avg((kbytes * 8) / duration) from projection_test prewhere domain_alias = 1 where domain = '1' group by dt_m order by dt_m;
-- drop row policy filter on projection_test;

select toStartOfMinute(datetime) dt_m, count(), sum(block_count) / sum(duration), avg(block_count / duration) from projection_test group by dt_m order by dt_m;
-- TODO figure out how to deal with conflict column names
-- select toStartOfMinute(datetime) dt_m, count(), sum(block_count) / sum(duration), avg(block_count / duration) from projection_test where `sum(block_count)` = 1 group by dt_m order by dt_m;

select toStartOfMinute(datetime) dt_m, sum(buffer_time) / sum(duration), avg(buffer_time / duration), sum(valid_bytes) / sum(total_bytes), sum(completed_bytes) / sum(total_bytes), sum(fixed_bytes) / sum(total_bytes), sum(force_bytes) / sum(total_bytes), sum(valid_bytes) / sum(total_bytes) from projection_test where domain in ('12', '14') group by dt_m order by dt_m;
select toStartOfMinute(datetime) dt_m, domain, sum(retry_count) / sum(duration), avg(retry_count / duration), countIf(block_count > 0) / count(), countIf(first_time = 0) / count() from projection_test group by dt_m, domain having domain = '19' order by dt_m, domain;
select toStartOfHour(toStartOfMinute(datetime)) dt_h, uniqHLL12(x_id), uniqHLL12(y_id) from projection_test group by dt_h order by dt_h;
SELECT 2, -1 FROM projection_test PREWHERE domain_alias = 1. WHERE domain = NULL GROUP BY -9223372036854775808 ORDER BY countIf(first_time = 0) / count(-2147483649) DESC NULLS LAST, 1048576 DESC NULLS LAST;
select max(key) from projection_without_key;
