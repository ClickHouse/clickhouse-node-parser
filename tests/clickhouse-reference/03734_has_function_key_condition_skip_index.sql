SELECT count()
FROM test_has_skip_minmax
WHERE has([5432, 7432, 9999], key_col);
SELECT count()
FROM test_has_skip_minmax
WHERE key_col IN [5432, 7432, 9999];
SELECT count() 
FROM test_has_skip_set 
WHERE has([10, 20, 30], user_id);
SELECT count() 
FROM test_has_skip_set 
WHERE user_id IN (10, 20, 30);
SELECT count()
FROM test_has_skip_bloom
WHERE has(['v_12345', 'v_54321', 'v_99999'], key_str);
SELECT count()
FROM test_has_skip_bloom
WHERE key_str IN ['v_12345', 'v_54321', 'v_99999'];
