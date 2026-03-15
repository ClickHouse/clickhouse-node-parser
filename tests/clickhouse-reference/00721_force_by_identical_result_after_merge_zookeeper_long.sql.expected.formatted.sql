-- Tags: long, zookeeper
SET prefer_warmed_unmerged_parts_seconds = 0;

CREATE TABLE byte_identical_r1
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00721/byte_identical', 'r1')
ORDER BY x;

CREATE TABLE byte_identical_r2
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00721/byte_identical', 'r2')
ORDER BY x;

SET replication_alter_partitions_sync = 2;

SELECT
    x,
    t1.y - t2.y
FROM
    byte_identical_r1 AS t1
LEFT JOIN byte_identical_r2 AS t2
    USING (x)
ORDER BY x ASC;