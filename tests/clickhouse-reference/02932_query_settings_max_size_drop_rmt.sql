SET insert_keeper_fault_injection_probability = 0.0;
CREATE TABLE test_max_size_drop (number UInt64)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_max_size_drop', '1')
ORDER BY number;
INSERT INTO test_max_size_drop SELECT number FROM numbers(1000);
