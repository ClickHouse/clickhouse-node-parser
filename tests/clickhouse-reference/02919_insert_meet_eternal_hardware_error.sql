CREATE TABLE t_hardware_error (
    KeyID UInt32
) Engine = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY (KeyID);
-- All 3 commits have been written correctly. The unknown status is ok (since it failed after the operation)
Select arraySort(groupArray(KeyID)) FROM t_hardware_error;
