CREATE TABLE mutate_and_zero_copy_replication1
(
    a UInt64,
    b String,
    c Float64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02427_mutate_and_zero_copy_replication/alter', '1')
ORDER BY tuple()
SETTINGS old_parts_lifetime = 0, cleanup_delay_period = 300, max_cleanup_delay_period = 300, cleanup_delay_period_random_add = 300, min_bytes_for_wide_part = 0;

CREATE TABLE mutate_and_zero_copy_replication2
(
    a UInt64,
    b String,
    c Float64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02427_mutate_and_zero_copy_replication/alter', '2')
ORDER BY tuple()
SETTINGS old_parts_lifetime = 0, cleanup_delay_period = 300, max_cleanup_delay_period = 300, cleanup_delay_period_random_add = 300;

SET mutations_sync = 2;

SELECT *
FROM mutate_and_zero_copy_replication2
WHERE NOT ignore(*);