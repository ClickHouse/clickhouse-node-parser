SELECT count(), sum(id) FROM tab WHERE hasAnyTokens(str, ['34567', '134567', '234567']);
SELECT count(), sum(id) FROM tab WHERE str LIKE '% 34567 %';
SELECT
    sum(ProfileEvents['ParallelReplicasUsedCount']) > 0,
    sum(ProfileEvents['TextIndexUsedEmbeddedPostings']) > 0
FROM system.query_log
WHERE (current_database = currentDatabase() OR position(query, currentDatabase()) > 0) AND query LIKE '%SELECT%tab%hasAnyTokens%' AND type = 'QueryFinish';
