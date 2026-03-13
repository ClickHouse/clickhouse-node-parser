SELECT
    k,
    l,
    m,
    n,
    count()
FROM t2
GROUP BY
    k,
    l,
    m,
    n
ORDER BY
    k ASC,
    l ASC,
    m ASC,
    n ASC;

-- The main query should have a cache miss and 3 global hits
-- The MV is executed 20 times (100 / 5) and each run does 1 miss and 4 hits to the LOCAL cache
-- In addition to this, to prepare the MV, there is an extra preparation to get the list of columns via
-- InterpreterSelectQuery, which adds 5 miss (since we don't use cache for preparation)
-- So in total we have:
-- Main query:  1  miss, 3 global
-- Preparation: 5  miss
-- Blocks (20): 20 miss, 0 global, 80 local hits
-- TOTAL:       26 miss, 3 global, 80 local
SELECT
    '02177_MV',
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '-- FIRST INSERT\nINSERT INTO t1\n%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);

SELECT *
FROM t3
ORDER BY z ASC;

SELECT
    '02177_MV_2',
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '-- SECOND INSERT\nINSERT INTO t1%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);

SELECT *
FROM t4
ORDER BY z ASC;

SELECT
    '02177_MV_3',
    ProfileEvents['ScalarSubqueriesGlobalCacheHit'] AS scalar_cache_global_hit,
    ProfileEvents['ScalarSubqueriesLocalCacheHit'] AS scalar_cache_local_hit,
    ProfileEvents['ScalarSubqueriesCacheMiss'] AS scalar_cache_miss
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '-- THIRD INSERT\nINSERT INTO t1%')
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(10);