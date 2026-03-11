SELECT
    number,
    sumDistinct(number) OVER ()
FROM numbers(0, 5)
ORDER BY number ASC;

SELECT
    number,
    sumDistinct(number) OVER (ORDER BY number ASC)
FROM numbers(0, 5)
ORDER BY number ASC;

SELECT
    number,
    s,
    minDistinct(s) OVER (PARTITION BY number % 2) AS min_varlen_string
FROM (
        SELECT
            number,
            toString(number % 5) AS s
        FROM numbers(11)
    )
ORDER BY number ASC;

SELECT
    arr,
    minDistinct(arr) OVER (ORDER BY arr ASC)
FROM (
        SELECT [toString(number), toString(number+1)] AS arr
        FROM numbers(10)
    )
ORDER BY arr ASC;

SELECT
    s,
    ts,
    argMaxDistinct(ts, s) OVER (PARTITION BY ts % 2) AS value_with_max_ts
FROM (
        SELECT
            number AS ts,
            toString(number % 5) AS s
        FROM numbers(11)
    )
ORDER BY ts ASC;