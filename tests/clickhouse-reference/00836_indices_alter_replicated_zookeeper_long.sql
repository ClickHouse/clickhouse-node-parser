SET replication_alter_partitions_sync = 2;
CREATE TABLE minmax_idx
(
    u64 UInt64,
    i32 Int32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00836/indices_alter1', 'r1')
ORDER BY u64;
CREATE TABLE minmax_idx_r
(
    u64 UInt64,
    i32 Int32
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00836/indices_alter1', 'r2')
ORDER BY u64;
SELECT * FROM minmax_idx WHERE u64 * i32 = 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx_r WHERE u64 * i32 = 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx WHERE u64 * i32 > 1 ORDER BY (u64, i32);
SELECT * FROM minmax_idx_r WHERE u64 * i32 > 1 ORDER BY (u64, i32);
CREATE TABLE minmax_idx2
(
    u64 UInt64,
    i32 Int32,
    INDEX idx1 u64 + i32 TYPE minmax GRANULARITY 10,
    INDEX idx2 u64 * i32 TYPE minmax GRANULARITY 10
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00836/indices_alter2', 'r1')
ORDER BY u64;
CREATE TABLE minmax_idx2_r
(
    u64 UInt64,
    i32 Int32,
    INDEX idx1 u64 + i32 TYPE minmax GRANULARITY 10,
    INDEX idx2 u64 * i32 TYPE minmax GRANULARITY 10
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00836/indices_alter2', 'r2')
ORDER BY u64;
SELECT * FROM minmax_idx2 WHERE u64 * i32 >= 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx2_r WHERE u64 * i32 >= 2 ORDER BY (u64, i32);
