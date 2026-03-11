SELECT count() FROM (SELECT * FROM 02919_test_table_noarg LIMIT 100);
SELECT count() FROM (SELECT * FROM 02919_test_table_valid_args LIMIT 100);
SELECT count() FROM (SELECT * FROM 02919_test_table_reuse_args LIMIT 100);
SELECT count(str1), count(str2) FROM (SELECT str1, str2 FROM 02919_test_multi_col LIMIT 100);
