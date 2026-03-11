SELECT count(), sum(id) FROM tab WHERE hasAnyTokens(str, ['34567', '134567', '234567']);
SELECT
    ProfileEvents['RemoteFSPrefetchedReads'] > 0
FROM system.query_log
WHERE current_database = currentDatabase() AND query LIKE '%SELECT count(), sum(id) FROM tab%' AND type = 'QueryFinish';
