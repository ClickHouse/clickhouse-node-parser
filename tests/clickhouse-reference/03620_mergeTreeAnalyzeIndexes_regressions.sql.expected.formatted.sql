SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193);

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193, 'no_such_part');

SELECT *
FROM mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193, '.*|no_such_part');