SELECT count() FROM tab WHERE s LIKE '%888%' SETTINGS use_skip_indexes = 0;
SELECT count() FROM tab WHERE hasAnyTokens(s, '888');
SELECT
    ProfileEvents['TextIndexHeaderCacheMisses'] > 0,
    ProfileEvents['TextIndexDictionaryBlockCacheMisses'] > 0,
    ProfileEvents['TextIndexPostingsCacheMisses'] > 0
FROM system.query_log
WHERE current_database = currentDatabase() AND query LIKE '%SELECT count() FROM tab%' AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
