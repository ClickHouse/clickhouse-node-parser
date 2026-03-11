-- { echo }
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 0);
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 5_000_000);
SELECT * FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 100_000_000);
