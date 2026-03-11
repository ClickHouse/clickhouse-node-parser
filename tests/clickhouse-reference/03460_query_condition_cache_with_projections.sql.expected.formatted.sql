SELECT j
FROM t
WHERE j > 3
    AND i = 20
ORDER BY j ASC
SETTINGS
    max_threads = 1,
    use_query_condition_cache = 1,
    query_condition_cache_store_conditions_as_plaintext = 1;

SELECT part_name
FROM `system`.query_condition_cache
ORDER BY part_name ASC;