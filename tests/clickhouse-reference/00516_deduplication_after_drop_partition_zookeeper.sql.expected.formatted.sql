-- Tags: zookeeper
DROP TABLE IF EXISTS deduplication_by_partition;

CREATE TABLE deduplication_by_partition
(
    d Date,
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00516/deduplication_by_partition', 'r1')
ORDER BY x
PARTITION BY toYYYYMM(d);

INSERT INTO deduplication_by_partition;

INSERT INTO deduplication_by_partition;

INSERT INTO deduplication_by_partition;

SELECT *
FROM deduplication_by_partition
ORDER BY
    d ASC,
    x ASC;

INSERT INTO deduplication_by_partition;

INSERT INTO deduplication_by_partition;

DROP TABLE deduplication_by_partition;