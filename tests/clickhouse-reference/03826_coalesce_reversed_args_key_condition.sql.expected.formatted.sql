SELECT count()
FROM test_coalesce_reversed
WHERE toDateTime64('2025-01-01 00:00:00', 3) > coalesce(toDateTime64('1970-01-01 00:00:00', 3), ts);

SELECT count()
FROM test_coalesce_reversed
WHERE toDateTime64('2025-01-01 00:00:00', 3) >= coalesce(toDateTime64('1970-01-01 00:00:00', 3), ts);

SELECT count()
FROM test_coalesce_reversed
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3);