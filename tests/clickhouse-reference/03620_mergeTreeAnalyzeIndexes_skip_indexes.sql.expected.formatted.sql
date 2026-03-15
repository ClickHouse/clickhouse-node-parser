CREATE TABLE with_skip_index
(
    key Int,
    value Int,
    INDEX value_idx value TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key;

-- { echo }
SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 0);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 5000000);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 100000000);