SELECT countDistinct(a)
FROM table_02152;

SELECT countDistinct(b)
FROM table_02152;

SELECT uniqExact(m)
FROM (
        SELECT
            number,
            ((number / 2))::UInt64 AS m
        FROM numbers(10)
    );

SELECT uniqExact(x)
FROM numbers(10)
GROUP BY number % 2 AS x;