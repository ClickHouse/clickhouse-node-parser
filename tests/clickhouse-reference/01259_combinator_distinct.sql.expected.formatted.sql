SELECT sumDistinct(number)
FROM numbers_mt(100000);

SELECT sumDistinct(number % 13)
FROM numbers_mt(100000);

SELECT arraySort(groupArrayDistinct(number % 13))
FROM numbers_mt(100000);

SELECT finalizeAggregation(countStateDistinct(toString(number % 20)))
FROM numbers_mt(100000);

SELECT round(corrStableDistinct(x, y), 5)
FROM (
        SELECT
            number % 10 AS x,
            number % 5 AS y
        FROM numbers(1000)
    );

SELECT round(corrStable(x, y), 5)
FROM (
        SELECT DISTINCT
            number % 10 AS x,
            number % 5 AS y
        FROM numbers(1000)
    );

SELECT sumDistinct(y)
FROM (
        SELECT
            number % 5 AS x,
            number % 15 AS y
        FROM numbers(1000)
    )
GROUP BY x
ORDER BY x ASC;

SELECT countIfDistinct(number % 10, number % 5 = 2)
FROM numbers(10000);

SELECT sumIfDistinct(number % 10, number % 5 = 2)
FROM numbers(10000);