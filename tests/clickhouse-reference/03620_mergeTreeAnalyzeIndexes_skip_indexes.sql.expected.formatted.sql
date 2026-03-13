-- { echo }
SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 0);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 5000000);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), 'with_skip_index', value > 100000000);