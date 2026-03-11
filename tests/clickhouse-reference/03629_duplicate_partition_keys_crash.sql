-- This SELECT should not crash (was causing segfault before fix)
SELECT count() FROM test_duplicate_partition_keys WHERE c1 = 1;
-- Test the SELECT with different conditions
SELECT c0, c1 FROM test_duplicate_partition_keys WHERE c1 = 2 ORDER BY c0;
-- This should also work without crashing
SELECT count() FROM test_duplicate_partition_keys2 WHERE b = 10;
-- Test SELECT with triple duplicate partition keys
SELECT count() FROM test_triple_duplicate WHERE x = 1;
SELECT count() FROM test_mixed_duplicates WHERE id = 1;
SELECT count() FROM test_type_duplicates WHERE uint_col = 100;
SELECT count() FROM test_hash_duplicates WHERE data = 'sample1';
SELECT count() FROM test_extreme_repeats WHERE x = 1;
SELECT count() FROM test_performance_duplicates WHERE category = 5;
