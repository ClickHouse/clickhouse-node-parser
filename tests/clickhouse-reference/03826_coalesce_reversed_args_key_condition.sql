-- This query triggered "Inconsistent KeyCondition behavior" because
-- coalesce(non_null_const, ts) was treated as monotonic w.r.t. ts
-- due to using the wrong argument type in matchesExactContinuousRange().
SELECT count() FROM test_coalesce_reversed WHERE toDateTime64('2025-01-01 00:00:00', 3) > coalesce(toDateTime64('1970-01-01 00:00:00', 3), ts);
-- Also test the >= variant
SELECT count() FROM test_coalesce_reversed WHERE toDateTime64('2025-01-01 00:00:00', 3) >= coalesce(toDateTime64('1970-01-01 00:00:00', 3), ts);
-- And the normal order (coalesce(ts, const)) which should also work
SELECT count() FROM test_coalesce_reversed WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3);
