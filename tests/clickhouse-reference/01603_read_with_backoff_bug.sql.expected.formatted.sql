-- optimize table t final;
SELECT
    count(),
    sum(length(s))
FROM t
SETTINGS
    max_threads = 3,
    read_backoff_min_latency_ms = 1,
    read_backoff_max_throughput = 1000000000,
    read_backoff_min_interval_between_events_ms = 1,
    read_backoff_min_events = 1,
    read_backoff_min_concurrency = 1;