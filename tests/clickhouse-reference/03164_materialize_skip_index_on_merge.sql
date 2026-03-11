SELECT count() FROM tab WHERE a >= 110 AND a < 130 AND b = 2;
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1 SELECT count() FROM tab WHERE a >= 110 AND a < 130 AND b = 2
)
WHERE explain LIKE '%Skip%' OR explain LIKE '%Name:%' OR explain LIKE '%Granules:%';
SELECT database, table, name, data_compressed_bytes FROM system.data_skipping_indices WHERE database = currentDatabase() AND table = 'tab';
SELECT count(), sum(ProfileEvents['MergeTreeDataWriterSkipIndicesCalculationMicroseconds'])
FROM system.query_log
WHERE current_database = currentDatabase()
    AND query LIKE 'OPTIMIZE TABLE tab FINAL'
    AND type = 'QueryFinish';
