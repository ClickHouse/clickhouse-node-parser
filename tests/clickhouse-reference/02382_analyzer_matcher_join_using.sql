SET enable_analyzer = 1;
CREATE TABLE test_table_join_1
(
    id UInt8,
    value String
) ENGINE = TinyLog;
CREATE TABLE test_table_join_2
(
    id UInt16,
    value String
) ENGINE = TinyLog;
CREATE TABLE test_table_join_3
(
    id UInt64,
    value String
) ENGINE = TinyLog;
-- { echoOn }

SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id, id, id) ORDER BY id, t1.value; -- { serverError BAD_ARGUMENTS }
SELECT '--';
SELECT * FROM test_table_join_1 AS t1 LEFT JOIN test_table_join_2 AS t2 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 RIGHT JOIN test_table_join_2 AS t2 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 FULL JOIN test_table_join_2 AS t2 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id) INNER JOIN test_table_join_3 AS t3 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id) LEFT JOIN test_table_join_3 AS t3 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id) RIGHT JOIN test_table_join_3 AS t3 USING (id) ORDER BY id, t1.value;
SELECT * FROM test_table_join_1 AS t1 INNER JOIN test_table_join_2 AS t2 USING (id) FULL JOIN test_table_join_3 AS t3 USING (id) ORDER BY id, t1.value;
