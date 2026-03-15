CREATE TABLE deduplication_by_partition
(
    d Date,
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00516/deduplication_by_partition', 'r1')
ORDER BY x
PARTITION BY toYYYYMM(d);

SELECT *
FROM deduplication_by_partition
ORDER BY
    d ASC,
    x ASC;