SET enable_analyzer = 1;

SELECT
    '02177_CTE_GLOBAL_ON',
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_microseconds,
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%SELECT ''02177_CTE_GLOBAL_ON%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);

SELECT
    '02177_CTE_GLOBAL_OFF',
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_microseconds,
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%02177_CTE_GLOBAL_OFF%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);

SELECT
    '02177_CTE_NEW_ANALYZER',
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_microseconds,
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%02177_CTE_NEW_ANALYZER%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);