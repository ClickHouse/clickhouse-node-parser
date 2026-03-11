SELECT '-- query_cache_nondeterministic_function_handling = throw';

SELECT count(now())
SETTINGS use_query_cache = true;

SELECT count(now())
SETTINGS
    use_query_cache = true,
    query_cache_nondeterministic_function_handling = 'throw';

SELECT count(*)
FROM `system`.query_cache;

SELECT count(now())
SETTINGS
    use_query_cache = true,
    query_cache_nondeterministic_function_handling = 'save';

SELECT count(now())
SETTINGS
    use_query_cache = true,
    query_cache_nondeterministic_function_handling = 'ignore';