SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String,
    value_array Array(UInt64),
    value_array_array Array(Array(UInt64))
) ENGINE=MergeTree ORDER BY tuple();
INSERT INTO test_table VALUES (0, 'Value', [1, 2, 3], [[1, 2, 3]]), (0, 'Value', [4, 5, 6], [[1, 2, 3], [4, 5, 6]]);
SELECT id, value, value_1 FROM test_table ARRAY JOIN [1, 2, 3] AS value_1;
SELECT '--';
SELECT id, value FROM test_table ARRAY JOIN [1, 2, 3] AS value;
SELECT id, value, value_1, value_2 FROM test_table ARRAY JOIN [[1, 2, 3]] AS value_1 ARRAY JOIN value_1 AS value_2;
SELECT 1 AS value FROM test_table ARRAY JOIN [1,2,3] AS value;
SELECT id, value, test_table.value_array FROM test_table ARRAY JOIN value_array;
SELECT id, value_array, value FROM test_table ARRAY JOIN value_array AS value;
SELECT id, value, value_array, value_array_element FROM test_table ARRAY JOIN value_array AS value_array_element;
SELECT id, value, value_array AS value_array_array_alias FROM test_table ARRAY JOIN value_array_array_alias;
SELECT id AS value FROM test_table ARRAY JOIN value_array AS value;
SELECT id, value, value_array AS value_array_array_alias, value_array_array_alias_element FROM test_table ARRAY JOIN value_array_array_alias AS value_array_array_alias_element;
SELECT id, value, value_array_array, value_array_array_inner_element, value_array_array_inner_element, value_array_array_inner_inner_element
FROM test_table ARRAY JOIN value_array_array AS value_array_array_inner_element
ARRAY JOIN value_array_array_inner_element AS value_array_array_inner_inner_element;
SELECT 1 FROM system.one ARRAY JOIN arrayMap(x -> ignore(*), []);
SELECT arrayFilter(x -> notEmpty(concat(x, 'hello')), [''])
FROM system.one
ARRAY JOIN
    [0] AS elem,
    arrayMap(x -> concat(x, ignore(ignore(toLowCardinality('03147_parquet_memory_tracking.parquet'), 37, 37, toUInt128(37), 37, 37, toLowCardinality(37), 37), 8, ignore(ignore(1., 36, 8, 8)), *), 'hello'), ['']) AS unused
WHERE NOT ignore(elem)
GROUP BY
    sum(ignore(ignore(ignore(1., 1, 36, 8, 8), ignore(52, 37, 37, '03147_parquet_memory_tracking.parquet', 37, 37, toUInt256(37), 37, 37, toNullable(37), 37, 37), 1., 1, 36, 8, 8), emptyArrayToSingle(arrayMap(x -> toString(x), arrayMap(x -> nullIf(x, 2), arrayJoin([[1]])))))) IGNORE NULLS,
    modulo(toLowCardinality('03147_parquet_memory_tracking.parquet'), number, toLowCardinality(3)); -- { serverError UNKNOWN_IDENTIFIER }
select [1, 2] as arr, x from system.one array join arr as x;
select x + 1 as x from (select [number] as arr from numbers(2)) as s array join arr as x;
