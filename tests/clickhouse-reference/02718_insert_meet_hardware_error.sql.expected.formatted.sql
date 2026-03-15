CREATE TABLE t_hardware_error
(
    KeyID UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY KeyID;

SELECT count()
FROM t_hardware_error;