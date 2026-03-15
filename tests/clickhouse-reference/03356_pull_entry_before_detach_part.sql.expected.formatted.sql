-- Tags: no-fasttest, no-parallel
-- Forbid fault injection to avoid part name randomization, since we rely on it
SET insert_keeper_fault_injection_probability = 0;

CREATE TABLE t1
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_03356/t1', '1')
ORDER BY tuple();