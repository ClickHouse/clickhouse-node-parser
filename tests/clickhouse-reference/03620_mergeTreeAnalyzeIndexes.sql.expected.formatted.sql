SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8193);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key >= 8193);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8192 + 1
    OR key = 8192 * 3 + 1);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8192 + 1
    OR key = 8192 * 5 + 1);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8193, 'all_1_1_0');

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8193, 'no_such_part');

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, value = 0);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key = 8193
    AND value = 0);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key IN (8193, 16385));