SET enable_parallel_replicas = 0;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    ts Int64,
    v LowCardinality(String),
    INDEX v v TYPE set(0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY (ts);

INSERT INTO test (v);