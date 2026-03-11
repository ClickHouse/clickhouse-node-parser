SELECT *
FROM `system`.data_skipping_indices
WHERE table = 'alter_index_test'
    AND database = currentDatabase();