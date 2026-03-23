CREATE TABLE t_hardware_error
(
    KeyID UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY (KeyID);

INSERT INTO t_hardware_error;

INSERT INTO t_hardware_error;

SELECT count()
FROM t_hardware_error;