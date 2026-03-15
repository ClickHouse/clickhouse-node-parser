SET enable_analyzer = 1;
CREATE TABLE test_table_join_1
(
    id UInt8,
    value String
)
ENGINE = TinyLog;
CREATE TABLE test_table_join_2
(
    id UInt16,
    value String
)
ENGINE = TinyLog;
SELECT
    toTypeName(t2_value),
    t2.value AS t2_value
FROM test_table_join_1 AS t1
INNER JOIN test_table_join_2 USING (id); -- { serverError UNKNOWN_IDENTIFIER };
SELECT
    toTypeName(t2_value),
    t2.value AS t2_value
FROM test_table_join_1 AS t1
INNER JOIN test_table_join_2 AS t2 USING (id);
