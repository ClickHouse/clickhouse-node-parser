SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key IN (
        SELECT key
        FROM data
        ORDER BY key ASC
        LIMIT 10
    ));

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key IN (
        SELECT key
        FROM data
        ORDER BY key DESC
        LIMIT 10
    ));

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key IN (keys_1));

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data, key IN (keys_2));