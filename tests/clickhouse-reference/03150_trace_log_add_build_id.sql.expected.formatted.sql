SELECT sleep(1);

SELECT COUNT(*) > 1
FROM `system`.trace_log
WHERE isNotNull(build_id);

SELECT countIf(arrayExists(x -> like(x, '%:%:%'), lines)) > 1
FROM `system`.trace_log;