select b from set_index where a = 1 and a = 1 and b = 1 settings force_data_skipping_indices = 'b_set', optimize_move_to_prewhere=0;
