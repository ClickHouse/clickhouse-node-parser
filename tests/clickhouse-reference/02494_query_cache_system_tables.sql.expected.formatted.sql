-- Test that the query cache rejects queries that involve system tables.
SELECT *
FROM `system`.one
SETTINGS use_query_cache = 1; -- { serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }

SELECT count(*)
FROM `system`.query_cache;

-- Test that the query cache rejects queries that involve system tables.
SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'throw'; -- { serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }

-- Test that the query cache saves the result of queries that involve system tables.
SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'save';

-- Test that the query cache ignores the result of queries that involve system tables.
SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'ignore';

SELECT *
FROM one
SETTINGS use_query_cache = 1; -- doesn't throw but should

-- This query uses system.zero internally. Since the query cache works at AST level it does not "see' system.zero and must not complain.
SELECT *
SETTINGS use_query_cache = 1;

-- information_schema is also treated as a system table
SELECT *
FROM information_schema.tables
SETTINGS use_query_cache = 1; -- { serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }

SELECT *
FROM tab
WHERE name = 'system.one'
SETTINGS use_query_cache = true;

-- System tables can be "hidden" inside e.g. table functions
SELECT *
FROM clusterAllReplicas('test_shard_localhost', `system`.one)
SETTINGS use_query_cache = 1; -- {serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }

SELECT *
FROM clusterAllReplicas('test_shard_localhost', 'system.one')
SETTINGS use_query_cache = 1; -- {serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }

SELECT *
FROM `system`
SETTINGS use_query_cache = 1;

SELECT *
FROM `system`.`system`
SETTINGS use_query_cache = 1; -- { serverError QUERY_CACHE_USED_WITH_SYSTEM_TABLE }