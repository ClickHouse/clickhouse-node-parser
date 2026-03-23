-- Tests merge tree 'setting' materialize_skip_indexes_on_merge
-- add_minmax_index_for_numeric_columns=0: Different indices and plans on b
SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    a UInt64,
    b UInt64,
    INDEX idx_a a TYPE minmax,
    INDEX idx_b b TYPE set(3)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 4, add_minmax_index_for_numeric_columns = 0;

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100);

INSERT INTO tab SELECT
    number,
    number / 50
FROM numbers(100, 100);

SELECT count()
FROM tab
WHERE a >= 110
    AND a < 130
    AND b = 2;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE a >= 110
            AND a < 130
            AND b = 2
    )
WHERE like(`explain`, '%Skip%')
    OR like(`explain`, '%Name:%')
    OR like(`explain`, '%Granules:%');

SELECT
    database,
    table,
    name,
    data_compressed_bytes
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'tab';

SELECT
    count(),
    sum(ProfileEvents['MergeTreeDataWriterSkipIndicesCalculationMicroseconds'])
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'OPTIMIZE TABLE tab FINAL')
    AND type = 'QueryFinish';

SET mutations_sync = 2;

SYSTEM DROP  TABLE tab;