CREATE TABLE t_hardware_error (
    KeyID UInt32
) Engine = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY (KeyID);
insert into t_hardware_error values (1), (2), (3), (4), (5);
insert into t_hardware_error values (6), (7), (8), (9), (10); -- {serverError UNKNOWN_STATUS_OF_INSERT}
insert into t_hardware_error values (11), (12), (13), (14), (15);
-- All 3 commits have been written correctly. The unknown status is ok (since it failed after the operation)
Select arraySort(groupArray(KeyID)) FROM t_hardware_error;
