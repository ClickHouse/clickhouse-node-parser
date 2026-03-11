SELECT throwIf(1)
SETTINGS use_query_cache = true;

SELECT COUNT(*)
FROM `system`.query_cache;