CREATE TABLE t_hardware_error (
	KeyID UInt32
) Engine = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY (KeyID);
select count() from t_hardware_error;
