SELECT count() FROM t_ind_merge_1 WHERE b < 100 SETTINGS force_data_skipping_indices = 'idx_b';
