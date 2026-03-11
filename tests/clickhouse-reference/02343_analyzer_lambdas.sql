SELECT arrayMap(x -> x + 1, [1,2,3]);
SELECT arrayMap((x -> toString(x)) as lambda, [1,2,3]), arrayMap(lambda, ['1','2','3']);
SELECT arrayMap(x -> id, [1,2,3]) FROM test_table;
SELECT arrayMap(x -> x + id, [1,2,3]) FROM test_table;
SELECT arrayMap((x -> concat(concat(toString(x), '_'), toString(id))) as lambda, [1,2,3]) FROM test_table;
SELECT arrayMap(lambda(tuple(x), x + 1), [1, 2, 3]);
SELECT arrayMap(lambda((x,), x + 1), [1, 2, 3]);
SELECT arraySort(lambda((x, y), y), ['world', 'hello'], [2, 1]);
