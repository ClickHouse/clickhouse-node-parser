-- { echo }
SELECT part_name
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT ranges
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges)) AS ranges_size
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);

SELECT sum(arraySum(arrayMap(e -> ((e.2) - (e.1)), ranges))) AS ranges_size
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 1000);