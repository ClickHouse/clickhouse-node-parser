create table with_skip_index (key Int, value Int, index value_idx value type minmax granularity 1) engine=MergeTree() order by key;
-- { echo }
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 0);
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 5_000_000);
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 100_000_000);
