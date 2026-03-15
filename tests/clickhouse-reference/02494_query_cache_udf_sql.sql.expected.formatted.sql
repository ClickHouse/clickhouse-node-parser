CREATE FUNCTION udf AS a -> a + 1;

SELECT '-- query_cache_nondeterministic_function_handling = throw';

SELECT udf(1)
FORMAT Null
SETTINGS use_query_cache = true, query_cache_nondeterministic_function_handling = 'throw'; -- { serverError QUERY_CACHE_USED_WITH_NONDETERMINISTIC_FUNCTIONS }

SELECT count(*)
FROM `system`.query_cache;

SELECT udf(1)
FORMAT Null
SETTINGS use_query_cache = true, query_cache_nondeterministic_function_handling = 'save';

SELECT udf(1)
FORMAT Null
SETTINGS use_query_cache = true, query_cache_nondeterministic_function_handling = 'ignore';