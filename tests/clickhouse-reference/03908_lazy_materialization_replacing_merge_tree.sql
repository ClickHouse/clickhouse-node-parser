-- Regression test for https://github.com/ClickHouse/ClickHouse/issues/88489
-- ReplacingMergeTree with Array(Tuple) columns failed with TOO_LARGE_ARRAY_SIZE
-- when using WHERE + ORDER BY + small LIMIT due to lazy materialization bug.

SET query_plan_optimize_lazy_materialization = 1;
SET query_plan_max_limit_for_lazy_materialization = 10;
CREATE TABLE t_lm_replacing
(
    timestamp DateTime,
    domain String,
    alert_match Array(Tuple(String, String)),
    data String
) ENGINE = ReplacingMergeTree()
ORDER BY (domain, timestamp);
-- This exact combination (WHERE + ORDER BY DESC + small LIMIT) was the failing pattern
SELECT count() FROM (
    SELECT * FROM t_lm_replacing
    WHERE domain = '172.16.96.212:5432'
    ORDER BY timestamp DESC
    LIMIT 10
);
