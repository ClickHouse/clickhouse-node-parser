SELECT uuid
FROM `system`.parts
WHERE database = 'memory_db';

SELECT count(*)
FROM `system`.query_condition_cache;

SELECT count(*)
FROM tab
WHERE val = 24;