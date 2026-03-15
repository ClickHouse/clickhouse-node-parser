CREATE TABLE tbl (key UInt64, agg UInt64) ENGINE = MergeTree ORDER BY key;
SELECT key, sum(agg) FROM tbl GROUP BY key WITH totals ORDER BY key SETTINGS use_query_cache = 1;
SELECT count(*) FROM system.query_cache;
SELECT '---';
SELECT key, sum(agg) FROM tbl GROUP BY key ORDER BY key SETTINGS use_query_cache = 1, extremes = 1;
SELECT key, sum(agg) FROM tbl GROUP BY key WITH totals ORDER BY key SETTINGS use_query_cache = 1, extremes = 1;
