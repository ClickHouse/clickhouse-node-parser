SELECT
    test_table_join_1.* APPLY toString,
    test_table_join_2.* APPLY toString,
    test_table_join_3.* APPLY toString
FROM test_table_join_1 AS t1
         INNER JOIN test_table_join_2 AS t2 ON t1.id = t2.id
         INNER JOIN test_table_join_3 AS t3 ON t2.id = t3.id;
