select min(i), max(i), count() from d;
select min(i), max(i), count() from d group by _partition_id order by _partition_id;
select min(i), max(i), count() from d where _partition_value.1 = 0 group by _partition_id order by _partition_id;
select min(i), max(i), count() from d where moduloLegacy(i, 2) = 0 group by _partition_id order by _partition_id;
select min(i), max(i), count() from d where _partition_value.1 = 10 group by _partition_id order by _partition_id;
-- fuzz crash
select min(i) from d where 1 = _partition_value.1;
-- fuzz crash https://github.com/ClickHouse/ClickHouse/issues/37151
SELECT min(i), max(i), count() FROM d WHERE (_partition_value.1) = 0 GROUP BY ignore(bitTest(ignore(NULL), 0), NULL, (_partition_value.1) = 7, '10.25', bitTest(NULL, 0), NULL, ignore(ignore(-2147483647, NULL)), 1024), _partition_id ORDER BY _partition_id ASC NULLS FIRST;
select min(j) from has_final_mark;
select min(j) from mixed_final_mark;
select min(j), max(j) from has_final_mark;
select min(j), max(j) from mixed_final_mark;
select count() from t;
select min(dt), max(dt), count() from d where toDate(dt) >= '2021-10-25';
-- fuzz crash
select min(dt), max(dt), count(toDate(dt) >= '2021-10-25') from d where toDate(dt) >= '2021-10-25';
select count() from d group by toDate(dt);
-- fuzz crash
SELECT min(dt), count(ignore(ignore(ignore(tupleElement(_partition_value, 'xxxx', NULL) = NULL), NULL, NULL, NULL), 0, '10485.76', NULL)), max(dt), count(toDate(dt) >= '2021-10-25') FROM d WHERE toDate(dt) >= '2021-10-25';
-- fuzz crash
SELECT pointInEllipses(min(j), NULL), max(dt), count('0.0000000007') FROM d WHERE toDate(dt) >= '2021-10-25';
SELECT min(j) FROM d PREWHERE ceil(j) <= 0;
SELECT min(dt) FROM d PREWHERE ((0.9998999834060669 AND 1023) AND 255) <= ceil(j);
SELECT count('') AND NULL FROM d PREWHERE ceil(j) <= NULL;
select count(if(d=4, d, 1)) from test settings force_optimize_projection = 1;
select count(d/3) from test settings force_optimize_projection = 1;
select count(if(d=4, Null, 1)) from test settings force_optimize_projection = 1; -- { serverError PROJECTION_NOT_USED }
