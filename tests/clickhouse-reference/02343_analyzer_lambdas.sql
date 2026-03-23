SET enable_analyzer = 1;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT arrayMap(x -> x + 1, [1,2,3]);
SELECT arrayMap((x -> toString(x)) as lambda, [1,2,3]), arrayMap(lambda, ['1','2','3']);
SELECT arrayMap(x -> id, [1,2,3]) FROM test_table;
SELECT arrayMap(x -> x + id, [1,2,3]) FROM test_table;
SELECT arrayMap((x -> concat(concat(toString(x), '_'), toString(id))) as lambda, [1,2,3]) FROM test_table;
DROP TABLE IF EXISTS test_table_tuple;
CREATE TABLE test_table_tuple
(
    id UInt64,
    value Tuple(value_0_level_0 String, value_1_level_0 String)
) ENGINE=TinyLog;
INSERT INTO test_table_tuple VALUES (0, ('value_0_level_0', 'value_1_level_0'));
SELECT arrayMap(lambda(tuple(x), x + 1), [1, 2, 3]);
SELECT arrayMap(lambda((x,), x + 1), [1, 2, 3]);
SELECT arraySort(lambda((x, y), y), ['world', 'hello'], [2, 1]);
DROP TABLE test_table_tuple;
DROP TABLE test_table;
