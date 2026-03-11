SELECT 1 + number
FROM `system`.numbers
LIMIT 1
SETTINGS use_query_cache = true;

SELECT count(*)
FROM `system`.query_cache;