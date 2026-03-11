SELECT * FROM mergeTreeIndex(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT * FROM mergeTreeIndex(currentDatabase()); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', non_existing_param = 1); -- { serverError BAD_ARGUMENTS }
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, non_existing_param = 1); -- { serverError BAD_ARGUMENTS }
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, with_minmax = 1, non_existing_param = 1); -- { serverError BAD_ARGUMENTS }
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params') ORDER BY ALL FORMAT TSVWithNames;
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1) ORDER BY ALL FORMAT TSVWithNames;
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_minmax = 1) ORDER BY ALL FORMAT TSVWithNames;
SELECT * FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, with_minmax = 1) ORDER BY ALL FORMAT TSVWithNames;
