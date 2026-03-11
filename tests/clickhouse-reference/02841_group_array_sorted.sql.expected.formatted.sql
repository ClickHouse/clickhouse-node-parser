SELECT groupArraySorted(5)(number)
FROM numbers(100);

SELECT groupArraySorted(10)(number)
FROM numbers(5);

SELECT groupArraySorted(100)(number)
FROM numbers(1000);

SELECT groupArraySorted(30)(str)
FROM (
        SELECT toString(number) AS str
        FROM numbers(30)
    );

SELECT groupArraySorted(10)(toInt64(number / 2))
FROM numbers(100);

SELECT groupArraySorted(3)(a)
FROM test;

SELECT groupArraySorted(4)(data)
FROM test;

SELECT groupArraySorted(5)(data)
FROM test;

SELECT count(id)
FROM test;

SELECT count(concat(toString(id), 'a'))
FROM test;

SELECT groupArraySortedMerge(2)(agg)
FROM test;