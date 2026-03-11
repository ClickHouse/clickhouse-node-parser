SELECT sum(key)
FROM test_10m;

SELECT sum(key)
FROM test_10m
WHERE key = 1;

SELECT
    normalizeQuery(query) AS q,
    ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0 AS not_blazingly_fast,
    ProfileEvents['DistributedIndexAnalysisMissingParts'] AS missing_parts,
    ProfileEvents['DistributedIndexAnalysisScheduledReplicas'] AS replicas,
    ProfileEvents['DistributedIndexAnalysisFailedReplicas'] > 0 AS failed_replicas
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND type != 'QueryStart'
    AND query_kind = 'Select'
    AND is_initial_query
    AND `Settings`['distributed_index_analysis'] = '1'
    AND endsWith(log_comment, concat('-', currentDatabase()))
ORDER BY event_time_microseconds ASC
FORMAT Vertical;