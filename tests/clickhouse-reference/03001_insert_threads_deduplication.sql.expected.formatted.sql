CREATE TABLE landing
(
    timestamp DateTime64(3),
    status String,
    id String
)
ENGINE = MergeTree()
ORDER BY timestamp;

CREATE TABLE landing_dist
(
    timestamp DateTime64(3),
    status String,
    id String
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), 'landing', rand());

CREATE TABLE ds
(
    timestamp DateTime64(3),
    status String,
    id String
)
ENGINE = MergeTree()
ORDER BY timestamp
SETTINGS non_replicated_deduplication_window = 1000;

SELECT count()
FROM ds;