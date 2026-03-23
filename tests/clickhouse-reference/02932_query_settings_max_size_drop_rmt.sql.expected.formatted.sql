SYSTEM DROP  TABLE IF EXISTS test_max_size_drop SYNC;

SET insert_keeper_fault_injection_probability = 0.0;

CREATE TABLE test_max_size_drop
(
    number UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_max_size_drop', '1')
ORDER BY number;

INSERT INTO test_max_size_drop SELECT number
FROM numbers(1000);

SYSTEM DROP  TABLE test_max_size_drop SETTINGS max_table_size_to_drop = 1; -- { serverError TABLE_SIZE_EXCEEDS_MAX_DROP_SIZE_LIMIT }

SYSTEM DROP  TABLE test_max_size_drop SYNC;