SELECT mapContains(a, 'name')
FROM table_map;

SELECT mapContains(a, 'gender')
FROM table_map;

SELECT mapContains(a, 'abc')
FROM table_map;

SELECT mapContains(a, b)
FROM table_map;

SELECT mapContains(a, 10)
FROM table_map;

SELECT mapKeys(a)
FROM table_map;

SELECT mapFromArrays(c, d)
FROM table_map;

SELECT
    mapContains(a, b),
    mapContains(a, c),
    mapContains(a, 233)
FROM table_map;

SELECT mapContains(a, 'aaa')
FROM table_map;

SELECT mapContains(b, 'aaa')
FROM table_map;

SELECT mapValues(a)
FROM table_map;

SELECT mapFromArrays(d, e)
FROM table_map;

SELECT
    map('aa', 4, 'bb', 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map('aa', 4, 'bb', 5) AS m,
    mapContains(m, 'aa'),
    mapContains(m, 'k');

SELECT
    map(0.1::Float32, 4, 0.2::Float32, 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map(0.1::Float32, 4, 0.2::Float32, 5) AS m,
    mapContains(m, 0.1::Float32),
    mapContains(m, 0.3::Float32);

SELECT
    map(1::LowCardinality(UInt8), 4, 2::LowCardinality(UInt8), 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map(1::LowCardinality(UInt8), 4, 2::LowCardinality(UInt8), 5) AS m,
    mapContains(m, 1),
    mapContains(m, 3),
    mapContains(m, 1::LowCardinality(UInt8)),
    mapContains(m, 3::LowCardinality(UInt8));

SELECT
    map(array(1, 2), 4, array(3, 4), 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map(array(1, 2), 4, array(3, 4), 5) AS m,
    mapContains(m, array(1, 2)),
    mapContains(m, array(1, 3));

SELECT
    map(map(1, 2), 4, map(3, 4), 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map(map(1, 2), 4, map(3, 4), 5) AS m,
    mapContains(m, map(1, 2)),
    mapContains(m, map(1, 3));

SELECT
    map(tuple(1, 2), 4, tuple(3, 4), 5) AS m,
    mapKeys(m),
    mapValues(m);

SELECT
    map(tuple(1, 2), 4, tuple(3, 4), 5) AS m,
    mapContains(m, tuple(1, 2)),
    mapContains(m, tuple(1, 3));

SELECT
    map(0, 0) AS m,
    mapContains(m, number % 2)
FROM numbers(2);

SELECT mapFromArrays(['aa', 'bb'], [4, 5]);

SELECT mapFromArrays(['aa', 'bb'], materialize([4, 5]))
FROM numbers(2);

SELECT mapFromArrays([1.0, 2.0], [4, 5]);

SELECT mapFromArrays([1.0, 2.0], materialize([4, 5]))
FROM numbers(2);

SELECT mapFromArrays(materialize(['aa', 'bb']), [4, 5])
FROM numbers(2);

SELECT mapFromArrays(materialize(['aa', 'bb']), materialize([4, 5]))
FROM numbers(2);

SELECT mapFromArrays('aa', [4, 5]);

SELECT mapFromArrays(['aa', 'bb'], 5);

SELECT mapFromArrays(['aa', 'bb'], [4, 5], [6, 7]);

SELECT mapFromArrays(['aa', 'bb'], [4, 5, 6]);

SELECT mapFromArrays([[1,2], [3,4]], [4, 5, 6]);

SELECT mapFromArrays(['a', 2], [4, 5]);

SELECT mapFromArrays([1, 2], [4, 'a']);

SELECT mapFromArrays(['aa', 'bb'], map('a', 4));

SELECT mapFromArrays([1,null]::Array(Nullable(UInt8)), [3,4]);

SELECT mapFromArrays(['aa', 'bb'], map('a', 4, 'b', 5));

SELECT mapFromArrays(['aa', 'bb'], materialize(map('a', 4, 'b', 5)))
FROM numbers(2);

SELECT mapFromArrays([toLowCardinality(1), toLowCardinality(2)], [4, 5]);

SELECT mapFromArrays([toLowCardinality(1), toLowCardinality(2)], materialize([4, 5]))
FROM numbers(2);

SELECT mapFromArrays([1,2], [3,4]);

SELECT mapFromArrays([1,2]::Array(Nullable(UInt8)), [3,4]);

SELECT
    mapFromArrays([1,2], [3,4]) AS x,
    mapFromArrays(x, ['a', 'b']);

SELECT mapFromArrays(map(1, 'a', 2, 'b'), array('c', 'd'));

SELECT mapFromArrays(materialize(map(1, 'a', 2, 'b')), array('c', 'd'));

SELECT mapFromArrays(map(1, 'a', 2, 'b'), materialize(array('c', 'd')));

SELECT mapFromArrays(materialize(map(1, 'a', 2, 'b')), materialize(array('c', 'd')));