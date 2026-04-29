SELECT sleep(2)
FORMAT Null; --More than collect_interval_milliseconds

SYSTEM flush logs metric_log;

SELECT count() > 0
FROM `system`.metric_log;