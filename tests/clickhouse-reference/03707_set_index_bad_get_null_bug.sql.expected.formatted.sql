SET enable_parallel_replicas = 0;

CREATE TABLE test
(
    ts Int64,
    v LowCardinality(String),
    INDEX v v TYPE set(0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY ts;