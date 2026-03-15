-- Tags: distributed
SET enable_parallel_replicas = 0;

CREATE TABLE test5346
(
    Id String,
    Timestamp DateTime,
    updated DateTime
)
ENGINE = ReplacingMergeTree(updated)
ORDER BY (Timestamp, Id)
PARTITION BY tuple();

SELECT
    Id,
    Timestamp
FROM remote('localhost,127.0.0.1,127.0.0.2', currentDatabase(), 'test5346') FINAL
ORDER BY Timestamp ASC;

SELECT
    Id,
    Timestamp
FROM remote('localhost,127.0.0.1,127.0.0.2', currentDatabase(), 'test5346') FINAL
ORDER BY identity(Timestamp) ASC;