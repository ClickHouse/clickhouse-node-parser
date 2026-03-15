SET allow_experimental_nullable_tuple_type = 1;
SELECT tupleElement(CAST(NULL AS Nullable(Tuple(Int32, String))), 1);
SELECT toTypeName(tupleElement(CAST(NULL AS Nullable(Tuple(Int32, String))), 1));
SELECT tupleElement(CAST((1, 'hello') AS Nullable(Tuple(Int32, String))), 2);
SELECT toTypeName(tupleElement(CAST((1, 'hello') AS Nullable(Tuple(Int32, String))), 2));
SELECT tupleElement([CAST((1, 'a') AS Nullable(Tuple(Int32, String))), NULL], 1);
SELECT toTypeName(tupleElement([CAST((1, 'a') AS Nullable(Tuple(Int32, String))), NULL], 1));
SELECT tupleElement([CAST(([1, 2, 3], 'a') AS Nullable(Tuple(Array(Int32), String))), CAST(NULL AS Nullable(Tuple(Array(Int32), String))), NULL], 1);
SELECT toTypeName(tupleElement([CAST(([1, 2, 3], 'a') AS Nullable(Tuple(Array(Int32), String))), CAST(NULL AS Nullable(Tuple(Array(Int32), String))), NULL], 1));
SELECT tupleElement(CAST(NULL AS Nullable(Tuple(Int8, String))), 3);-- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
SELECT tupleElement(CAST([(1, 7), (3, 4), (2, 8)] AS Array(Nullable(Tuple(x Int8, y Int8)))), 'y');
SELECT toTypeName(tupleElement(CAST([(1, 7), (3, 4), (2, 8)] AS Array(Nullable(Tuple(x Int8, y Int8)))), 'y'));
SELECT tupleElement([CAST((1, 'a') AS Nullable(Tuple(Nullable(Int32), String))), NULL], 1);
SELECT toTypeName(tupleElement([CAST((1, 'a') AS Nullable(Tuple(Nullable(Int32), String))), NULL], 1));
SELECT tupleElement(CAST((1, 'hello') AS Nullable(Tuple(Int32, String))), 5, 'default_value');
SELECT toTypeName(tupleElement(CAST((1, 'hello') AS Nullable(Tuple(Int32, String))), 5, 'default_value'));
SELECT tupleElement(CAST(NULL AS Nullable(Tuple(Int32, String))), 1, 999);
SELECT toTypeName(tupleElement(CAST(NULL AS Nullable(Tuple(Int32, String))), 1, 999));
SELECT tupleElement(CAST(((1, 'inner'), 'outer') AS Nullable(Tuple(Tuple(Int32, String), String))), 1);
SELECT toTypeName(tupleElement(CAST(((1, 'inner'), 'outer') AS Nullable(Tuple(Tuple(Int32, String), String))), 1));
SELECT tupleElement(CAST(NULL AS Nullable(Tuple(Tuple(Int32, String), String))), 1);
SELECT toTypeName(tupleElement(CAST(NULL AS Nullable(Tuple(Tuple(Int32, String), String))), 1));
SELECT tupleElement((1, CAST(NULL AS Nullable(String))), 2);
SELECT toTypeName(tupleElement((1, CAST(NULL AS Nullable(String))), 2));
SELECT tupleElement([[CAST((1, 'a') AS Nullable(Tuple(Int32, String))), NULL], [NULL, CAST((2, 'b') AS Nullable(Tuple(Int32, String)))]], 1);
SELECT toTypeName(tupleElement([[CAST((1, 'a') AS Nullable(Tuple(Int32, String))), NULL], [NULL, CAST((2, 'b') AS Nullable(Tuple(Int32, String)))]], 1));
SELECT tupleElement(CAST(tuple() AS Nullable(Tuple())), 1); -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
SELECT tupleElement([CAST(NULL AS Nullable(Tuple(Int32, String))), NULL, NULL], 1);
SELECT toTypeName(tupleElement([CAST(NULL AS Nullable(Tuple(Int32, String))), NULL, NULL], 1));
SELECT tupleElement(CAST((1, 'hello') AS Nullable(Tuple(x Int32, y String))), 'z', 'default');
SELECT toTypeName(tupleElement(CAST((1, 'hello') AS Nullable(Tuple(x Int32, y String))), 'z', 'default'));
SELECT tupleElement(CAST((1, 2, 3, 4, 5, 6, 7, 8, 9, 10) AS Nullable(Tuple(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32))), 10);
SELECT toTypeName(tupleElement(CAST((1, 2, 3, 4, 5, 6, 7, 8, 9, 10) AS Nullable(Tuple(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32))), 10));
SELECT tupleElement(materialize(CAST((42, 'const') AS Nullable(Tuple(Int32, String)))), 1) FROM numbers(3);
SELECT toTypeName(tupleElement(materialize(CAST((42, 'const') AS Nullable(Tuple(Int32, String)))), 1)) FROM numbers(3);
SELECT
    tupleElement(CAST((1, 'hello', 3.14) AS Nullable(Tuple(Int32, String, Float64))), 1) as first,
    tupleElement(CAST((1, 'hello', 3.14) AS Nullable(Tuple(Int32, String, Float64))), 2) as second,
    tupleElement(CAST((1, 'hello', 3.14) AS Nullable(Tuple(Int32, String, Float64))), 3) as third;
SELECT * FROM (
    SELECT CAST((number, toString(number)) AS Nullable(Tuple(Int32, String))) as t FROM numbers(5)
) WHERE tupleElement(t, 1) > 2;
SELECT tupleElement(CAST(NULL AS Nullable(Tuple(Int32, String))), 1) + 10;
SELECT
    sum(tupleElement(t, 1)) as sum_first,
    count(tupleElement(t, 1)) as count_first
FROM (
    SELECT CAST((number, toString(number)) AS Nullable(Tuple(Int32, String))) as t
    FROM numbers(10)
);
SELECT tupleElement([
    CAST((1, 'a') AS Nullable(Tuple(Int32, String))),
    NULL,
    CAST((2, 'b') AS Nullable(Tuple(Int32, String))),
    NULL,
    CAST((3, 'c') AS Nullable(Tuple(Int32, String)))
], 2);
CREATE TABLE test_nullable_tuples
(
    id UInt32,
    data Nullable(Tuple(Int32, String))
) ENGINE = Memory;
SELECT id, tupleElement(data, 1) as value, toTypeName(tupleElement(data, 1)) as type
FROM test_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(data, 2) as value, toTypeName(tupleElement(data, 2)) as type
FROM test_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(data, 1) as value
FROM test_nullable_tuples
WHERE tupleElement(data, 1) > 200
ORDER BY id;
SELECT
    count() as total,
    count(tupleElement(data, 1)) as non_null_count,
    countIf(tupleElement(data, 1) IS NULL) as null_count
FROM test_nullable_tuples;
SELECT
    sum(tupleElement(data, 1)) as sum_values,
    avg(tupleElement(data, 1)) as avg_values,
    min(tupleElement(data, 1)) as min_value,
    max(tupleElement(data, 1)) as max_value,
    count(tupleElement(data, 1)) as count_non_null
FROM test_nullable_tuples;
CREATE TABLE test_array_nullable_tuples
(
    id UInt32,
    records Array(Nullable(Tuple(Int32, String)))
) ENGINE = Memory;
SELECT id, tupleElement(records, 1) as values, toTypeName(tupleElement(records, 1)) as type
FROM test_array_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(records, 2) as values, toTypeName(tupleElement(records, 2)) as type
FROM test_array_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(record, 1) as value, tupleElement(record, 2) as name
FROM test_array_nullable_tuples
ARRAY JOIN records as record
WHERE record IS NOT NULL
ORDER BY id, value;
CREATE TABLE test_nullable_named_tuples
(
    id UInt32,
    person Nullable(Tuple(name String, age UInt8, salary Float64))
) ENGINE = Memory;
SELECT id,
    tupleElement(person, 'name') as name,
    tupleElement(person, 'age') as age,
    tupleElement(person, 'salary') as salary,
    toTypeName(tupleElement(person, 'name')) as name_type
FROM test_nullable_named_tuples
ORDER BY id;
SELECT id,
    tupleElement(person, 1) as name,
    tupleElement(person, 2) as age,
    tupleElement(person, 3) as salary
FROM test_nullable_named_tuples
ORDER BY id;
SELECT id, tupleElement(person, 'name') as name, tupleElement(person, 'salary') as salary
FROM test_nullable_named_tuples
WHERE tupleElement(person, 'salary') > 55000
ORDER BY id;
SELECT
    avg(tupleElement(person, 'age')) as avg_age,
    sum(tupleElement(person, 'salary')) as total_salary,
    count(tupleElement(person, 'name')) as count_people
FROM test_nullable_named_tuples;
SELECT
    t1.id as id1,
    t2.id as id2,
    tupleElement(t1.data, 1) as value1,
    tupleElement(t2.data, 1) as value2
FROM test_nullable_tuples t1
JOIN test_nullable_tuples t2 ON tupleElement(t1.data, 1) = tupleElement(t2.data, 1)
WHERE t1.id < t2.id
ORDER BY t1.id, t2.id;
SELECT
    tupleElement(data, 2) as category,
    count() as cnt,
    avg(tupleElement(data, 1)) as avg_value
FROM test_nullable_tuples
WHERE data IS NOT NULL
GROUP BY category
ORDER BY category;
SELECT id, tupleElement(data, 1) as value
FROM test_nullable_tuples
WHERE id IN (
    SELECT id
    FROM test_nullable_tuples
    WHERE tupleElement(data, 1) > 100
)
ORDER BY id;
SELECT
    id,
    CASE
        WHEN tupleElement(data, 1) IS NULL THEN 'null'
        WHEN tupleElement(data, 1) > 200 THEN 'high'
        WHEN tupleElement(data, 1) > 100 THEN 'medium'
        ELSE 'low'
    END as category
FROM test_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(data, 1, 999) as value
FROM test_nullable_tuples
ORDER BY id;
SELECT id, tupleElement(data, 5, 'default_string') as value
FROM test_nullable_tuples
ORDER BY id;
CREATE TABLE test_complex_nullable
(
    id UInt32,
    matrix Array(Array(Nullable(Tuple(x Int32, y Int32))))
) ENGINE = Memory;
SELECT id, tupleElement(matrix, 'x') as x_values, toTypeName(tupleElement(matrix, 'x')) as type
FROM test_complex_nullable
ORDER BY id;
SELECT id, tupleElement(matrix, 'y') as y_values
FROM test_complex_nullable
ORDER BY id;
SELECT
    id,
    value,
    row_number() OVER (ORDER BY value NULLS LAST, id)        AS rank,
    dense_rank()  OVER (ORDER BY value NULLS LAST)           AS dense_rank
FROM
(
    SELECT id, tupleElement(data, 1) AS value
    FROM test_nullable_tuples
)
ORDER BY rank;
SELECT DISTINCT tupleElement(data, 2) as category
FROM test_nullable_tuples
WHERE tupleElement(data, 2) IS NOT NULL
ORDER BY category;
SELECT value
FROM
(
    SELECT tupleElement(data, 1) AS value FROM test_nullable_tuples WHERE id <= 2
    UNION ALL
    SELECT tupleElement(data, 1) AS value FROM test_nullable_tuples WHERE id >= 4
)
ORDER BY value NULLS LAST;
SELECT id, tupleElement(data, 1) as value
FROM test_nullable_tuples
WHERE tupleElement(data, 1) IN (100, 300, 500)
ORDER BY id;
SELECT id, tupleElement(data, 1) as value, tupleElement(data, 2) as name
FROM test_nullable_tuples
ORDER BY tupleElement(data, 1) NULLS LAST, id;
