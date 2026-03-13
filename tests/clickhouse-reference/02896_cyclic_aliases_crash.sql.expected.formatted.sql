SELECT
    val,
    val + 1 AS prev,
    val + prev AS val
FROM (
        SELECT 1 AS val
    ); -- { serverError CYCLIC_ALIASES, UNKNOWN_IDENTIFIER, TOO_DEEP_RECURSION }

SELECT
    val,
    val + 1 AS prev,
    val + prev AS val2
FROM (
        SELECT 1 AS val
    );

SELECT
    number % 2 AS number,
    count()
FROM numbers(10)
WHERE number != 0
GROUP BY number % 2 AS number;

SELECT
    toStartOfDay(toDateTime(time_stamp_utc)) AS time_stamp_utc,
    sum(impressions) AS Impressions,
    sum(clicks) AS Clicks,
    sum(revenue) AS Revenue
FROM test_table
WHERE (time_stamp_utc >= toDateTime('2024-04-25 00:00:00'))
    AND (time_stamp_utc < toDateTime('2024-05-02 00:00:00'))
GROUP BY time_stamp_utc
ORDER BY Impressions DESC
LIMIT 1000;

SELECT sum AS sum
FROM (
        SELECT sum(sum) AS sum
        FROM test_table
    );