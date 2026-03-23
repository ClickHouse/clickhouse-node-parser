-- Tags: no-replicated-database
-- no-replicated-database: OPTIMIZE is replicated which affects the part names.

SET insert_keeper_fault_injection_probability = 0.0;
SET enable_lightweight_update = 1;
CREATE TABLE t_shared (id UInt64, c1 UInt64)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_shared/', '1')
ORDER BY id
SETTINGS
    enable_block_number_column = 1,
    enable_block_offset_column = 1,
    apply_patches_on_merge = 0,
    cleanup_delay_period = 1000,
    max_cleanup_delay_period = 1000;
INSERT INTO t_shared SELECT number, number FROM numbers(20);
INSERT INTO t_shared SELECT number, number FROM numbers(20, 10);
SET mutations_sync = 2;
SELECT * FROM t_shared ORDER BY id SETTINGS apply_patch_parts = 1;
SELECT * FROM t_shared ORDER BY id SETTINGS apply_patch_parts = 0;
SELECT name, rows FROM system.parts WHERE database = currentDatabase() AND table = 't_shared' AND active ORDER BY name;
