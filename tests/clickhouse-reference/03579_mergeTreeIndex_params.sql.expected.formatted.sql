SELECT *
FROM mergeTreeIndex();

SELECT *
FROM mergeTreeIndex(currentDatabase());

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', non_existing_param = 1);

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, non_existing_param = 1);

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, with_minmax = 1, non_existing_param = 1);

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params')
ORDER BY `ALL` ASC
FORMAT TSVWithNames;

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1)
ORDER BY `ALL` ASC
FORMAT TSVWithNames;

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_minmax = 1)
ORDER BY `ALL` ASC
FORMAT TSVWithNames;

SELECT *
FROM mergeTreeIndex(currentDatabase(), 't_mt_params', with_marks = 1, with_minmax = 1)
ORDER BY `ALL` ASC
FORMAT TSVWithNames;