SELECT sleep(1);
SELECT COUNT(*) > 1 FROM system.trace_log WHERE build_id IS NOT NULL;
SELECT countIf(arrayExists(x -> x LIKE '%:%:%', lines)) > 1 FROM system.trace_log;
