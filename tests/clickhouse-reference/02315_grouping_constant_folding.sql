CREATE TABLE test02315(a UInt64, b UInt64) ENGINE=MergeTree() ORDER BY (a, b);
-- { echoOn }
SELECT count() AS amount, a, b, GROUPING(a, b) FROM test02315 GROUP BY GROUPING SETS ((a, b), (a), ()) ORDER BY (amount, a, b) SETTINGS force_grouping_standard_compatibility=0;
SELECT count() AS amount, a, b, GROUPING(a, b) FROM test02315 GROUP BY ROLLUP(a, b) ORDER BY (amount, a, b) SETTINGS force_grouping_standard_compatibility=0;
SELECT count() AS amount, a, b, GROUPING(a, b) FROM test02315 GROUP BY GROUPING SETS ((a, b), (a, a), ()) ORDER BY (amount, a, b) SETTINGS force_grouping_standard_compatibility=0, enable_analyzer=1;
