
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193);
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193, 'no_such_part');
select * from mergeTreeAnalyzeIndexes(currentDatabase(), data_add_minmax_index_for_numeric_columns, key = 8193, '.*|no_such_part');
