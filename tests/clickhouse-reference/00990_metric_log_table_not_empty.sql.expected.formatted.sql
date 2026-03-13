SELECT sleep(2)
FORMAT Null; --More than collect_interval_milliseconds

SELECT count() > 0
FROM `system`.metric_log;