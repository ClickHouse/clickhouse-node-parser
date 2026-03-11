SELECT *
FROM `system`.one
SETTINGS use_query_cache = 1;

SELECT count(*)
FROM `system`.query_cache;

SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'throw';

SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'save';

SELECT *
FROM `system`.one
SETTINGS
    use_query_cache = 1,
    query_cache_system_table_handling = 'ignore';

SELECT *
FROM one
SETTINGS use_query_cache = 1;

SELECT *
SETTINGS use_query_cache = 1;

SELECT *
FROM information_schema.tables
SETTINGS use_query_cache = 1;

SELECT *
FROM tab
WHERE name = 'system.one'
SETTINGS use_query_cache = true;

SELECT *
FROM clusterAllReplicas('test_shard_localhost', `system`.one)
SETTINGS use_query_cache = 1;

SELECT *
FROM clusterAllReplicas('test_shard_localhost', 'system.one')
SETTINGS use_query_cache = 1;

SELECT *
FROM `system`
SETTINGS use_query_cache = 1;

SELECT *
FROM `system`.`system`
SETTINGS use_query_cache = 1;