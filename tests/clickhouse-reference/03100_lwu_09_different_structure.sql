-- Tags: no-replicated-database
-- no-replicated-database: 03100_lwu_03_join

SET insert_keeper_fault_injection_probability = 0.0;
SET enable_lightweight_update = 1;
CREATE TABLE t_shared (id UInt64, c1 UInt64, s String)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_shared/', '1')
ORDER BY id
SETTINGS
    enable_block_number_column = true,
    enable_block_offset_column = true,
    shared_merge_tree_disable_merges_and_mutations_assignment = 1,
    apply_patches_on_merge = 0;
INSERT INTO t_shared SELECT number, number, 's' || toString(number) FROM numbers(20);
SET apply_patch_parts = 1;
SELECT * FROM t_shared ORDER BY id;
SELECT name, rows FROM system.parts WHERE database = currentDatabase() AND table = 't_shared' AND active ORDER BY name;
