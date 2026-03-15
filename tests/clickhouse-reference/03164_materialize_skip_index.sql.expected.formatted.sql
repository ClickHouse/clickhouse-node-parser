CREATE TABLE t_skip_index_insert
(
    a UInt64,
    b UInt64,
    INDEX idx_a a TYPE minmax,
    INDEX idx_b b TYPE set(3)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 4, add_minmax_index_for_numeric_columns = 0;

SET enable_analyzer = 1;

SET materialize_skip_indexes_on_insert = 0;

SELECT count()
FROM t_skip_index_insert
WHERE a >= 110
    AND a < 130
    AND b = 2;

SET mutations_sync = 2;

SELECT
    count(),
    sum(ProfileEvents['MergeTreeDataWriterSkipIndicesCalculationMicroseconds'])
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO t_skip_index_insert SELECT%')
    AND type = 'QueryFinish';