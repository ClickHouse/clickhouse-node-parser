SELECT
    val,
    val + 1 as prev,
    val + prev as val
FROM ( SELECT 1 as val )
; -- { serverError CYCLIC_ALIASES, UNKNOWN_IDENTIFIER, TOO_DEEP_RECURSION }
SELECT
    val,
    val + 1 as prev,
    val + prev as val2
FROM ( SELECT 1 as val )
;
select number % 2 as number, count() from numbers(10) where number != 0 group by number % 2 as number;
SELECT
    toStartOfDay(toDateTime(time_stamp_utc)) AS time_stamp_utc,
    sum(impressions) AS Impressions,
    sum(clicks) AS Clicks,
    sum(revenue) AS Revenue
FROM test_table
WHERE (time_stamp_utc >= toDateTime('2024-04-25 00:00:00')) AND (time_stamp_utc < toDateTime('2024-05-02 00:00:00'))
GROUP BY time_stamp_utc
ORDER BY Impressions DESC
LIMIT 1000;
select sum as sum from (select sum(sum) as sum from test_table);
