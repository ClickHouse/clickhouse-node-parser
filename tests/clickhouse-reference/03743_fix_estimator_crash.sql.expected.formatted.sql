-- Tags: no-fasttest
CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

SET query_plan_enable_optimizations = 0;

INSERT INTO t0 (c0);