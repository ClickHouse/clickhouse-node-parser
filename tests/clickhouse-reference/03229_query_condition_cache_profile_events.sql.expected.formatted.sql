-- Tests that queries with enabled query condition cache correctly populate profile events
SELECT '--- with move to PREWHERE';

SELECT count(*)
FROM tab
WHERE b = 10000
FORMAT Null
SETTINGS use_query_condition_cache = true;

SELECT
    ProfileEvents['QueryConditionCacheHits'],
    ProfileEvents['QueryConditionCacheMisses'],
    toInt32(ProfileEvents['SelectedMarks']) < toInt32(ProfileEvents['SelectedMarksTotal'])
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'SELECT count(*) FROM tab WHERE b = 10_000 FORMAT Null SETTINGS use_query_condition_cache = true;'
ORDER BY event_time_microseconds ASC;

SELECT *
FROM tab
WHERE b = 10000
FORMAT Null
SETTINGS use_query_condition_cache = true;

SELECT
    ProfileEvents['QueryConditionCacheHits'],
    ProfileEvents['QueryConditionCacheMisses'],
    toInt32(ProfileEvents['SelectedMarks']) < toInt32(ProfileEvents['SelectedMarksTotal'])
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'SELECT * FROM tab WHERE b = 10_000 FORMAT Null SETTINGS use_query_condition_cache = true;'
ORDER BY event_time_microseconds ASC;

SELECT count(*)
FROM tab
WHERE b = 10000
FORMAT Null
SETTINGS use_query_condition_cache = true, optimize_move_to_prewhere = false;

SELECT
    ProfileEvents['QueryConditionCacheHits'],
    ProfileEvents['QueryConditionCacheMisses'],
    toInt32(ProfileEvents['SelectedMarks']) < toInt32(ProfileEvents['SelectedMarksTotal'])
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'SELECT count(*) FROM tab WHERE b = 10_000 FORMAT Null SETTINGS use_query_condition_cache = true, optimize_move_to_prewhere = false;'
ORDER BY event_time_microseconds ASC;

SELECT *
FROM tab
WHERE b = 10000
FORMAT Null
SETTINGS use_query_condition_cache = true, optimize_move_to_prewhere = false;

SELECT
    ProfileEvents['QueryConditionCacheHits'],
    ProfileEvents['QueryConditionCacheMisses'],
    toInt32(ProfileEvents['SelectedMarks']) < toInt32(ProfileEvents['SelectedMarksTotal'])
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query = 'SELECT * FROM tab WHERE b = 10_000 FORMAT Null SETTINGS use_query_condition_cache = true, optimize_move_to_prewhere = false;'
ORDER BY event_time_microseconds ASC;