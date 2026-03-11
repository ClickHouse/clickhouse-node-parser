SELECT t1.id, t1.value, t2.value FROM test_table AS t1 INNER JOIN test_table_join AS t2 ON t1.id = t2.id WHERE t1.id = 0;
