SELECT 'a'
SETTINGS use_query_cache = true;

SELECT 'b'
SETTINGS use_query_cache = true;

SELECT count(*)
FROM `system`.query_cache;

SELECT 'c'
SETTINGS use_query_cache = true;

SELECT 'd'
SETTINGS use_query_cache = true;

SELECT '--';