-- Tags: no-random-settings

-- Test for query condition cache correctness with CTE constant folding.
-- When constants are folded from CTE expressions, different constant values must produce
-- different hashes. Otherwise the query condition cache returns wrong results.
-- https://github.com/ClickHouse/ClickHouse/issues/96060

SET use_query_condition_cache = 1;
CREATE TABLE test_qcc_cte (activity_year Int16) ENGINE = MergeTree ORDER BY activity_year;
-- Need enough rows to have multiple granules so the cache can incorrectly exclude some.
INSERT INTO test_qcc_cte SELECT number % 10 + 2018 FROM numbers(100000);
