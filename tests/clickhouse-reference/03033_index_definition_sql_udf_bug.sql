SELECT * FROM t4_2 WHERE test_func_1(col1, col3, col1) = 6
SETTINGS force_data_skipping_indices = 'ind4';
