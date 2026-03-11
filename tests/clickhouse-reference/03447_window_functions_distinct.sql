SELECT number, sum(DISTINCT number) OVER () FROM numbers(0, 5) ORDER BY number;
SELECT number, sum(DISTINCT number) OVER (ORDER BY number) FROM numbers(0, 5) ORDER BY number;
SELECT number, s, min(DISTINCT s) OVER(PARTITION BY number % 2) AS min_varlen_string
FROM
(
    SELECT number, toString(number % 5) AS s
    FROM numbers(11)
) ORDER BY number;
SELECT arr, min(DISTINCT arr) OVER (ORDER BY arr)
FROM
(
    SELECT [toString(number), toString(number+1)] AS arr
    FROM numbers(10)
) ORDER BY arr;
SELECT s, ts, argMax(DISTINCT ts, s) OVER(PARTITION BY ts % 2) AS value_with_max_ts
FROM
(
    SELECT number AS ts, toString(number % 5) AS s
    FROM numbers(11)
) ORDER BY ts;
