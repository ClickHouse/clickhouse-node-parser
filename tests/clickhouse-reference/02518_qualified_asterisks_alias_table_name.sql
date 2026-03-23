CREATE TABLE test_table_join_1 (id UInt64, value String) ENGINE = TinyLog;
CREATE TABLE test_table_join_2 (id UInt64, value String) ENGINE = TinyLog;
CREATE TABLE test_table_join_3 (id UInt64, value String ) ENGINE = TinyLog;
INSERT INTO test_table_join_1 VALUES (1, 'a');
INSERT INTO test_table_join_2 VALUES (1, 'b');
INSERT INTO test_table_join_3 VALUES (1, 'c');
SELECT
    test_table_join_1.* APPLY toString,
    test_table_join_2.* APPLY toString,
    test_table_join_3.* APPLY toString
FROM test_table_join_1 AS t1
         INNER JOIN test_table_join_2 AS t2 ON t1.id = t2.id
         INNER JOIN test_table_join_3 AS t3 ON t2.id = t3.id;
