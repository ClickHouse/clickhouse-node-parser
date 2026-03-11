SELECT b
FROM set_index
WHERE a = 1
    AND a = 1
    AND b = 1
SETTINGS
    force_data_skipping_indices = 'b_set',
    optimize_move_to_prewhere = 0;