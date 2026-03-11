SELECT '-- Run a query with query cache not enabled';

SELECT 124437993;

SELECT
    type,
    query,
    query_cache_usage
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT 124437993;'
    AND type = 'QueryFinish'
ORDER BY
    type ASC,
    query_cache_usage ASC;

SELECT 124437994
SETTINGS use_query_cache = 1;

SELECT
    type,
    query,
    query_cache_usage
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT 124437994 SETTINGS use_query_cache = 1;'
    AND type = 'QueryFinish'
ORDER BY
    type ASC,
    query_cache_usage ASC;

SELECT
    124437995,
    throwIf(1)
SETTINGS use_query_cache = 1;

SELECT
    query,
    query_cache_usage
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT 124437995, throwIf(1) SETTINGS use_query_cache = 1;'
    AND type = 'ExceptionWhileProcessing';