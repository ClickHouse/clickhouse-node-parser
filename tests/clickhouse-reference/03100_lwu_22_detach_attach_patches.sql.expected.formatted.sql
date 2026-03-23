-- Tags: no-replicated-database
-- no-replicated-database: fails due to additional shard.
SYSTEM DROP  TABLE IF EXISTS t_detach_attach_patches SYNC;

SYSTEM DROP  TABLE IF EXISTS t_detach_attach_patches_dst SYNC;

SET enable_lightweight_update = 1;

CREATE TABLE t_detach_attach_patches
(
    id UInt64,
    a UInt64,
    b UInt64,
    c UInt64
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_lwu_on_fly/', '1')
ORDER BY a
PARTITION BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

CREATE TABLE t_detach_attach_patches_dst AS t_detach_attach_patches
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_lwu_on_fly_dst/', '1')
ORDER BY a
PARTITION BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET apply_patch_parts = 1;

SET mutations_sync = 2;

SET insert_keeper_fault_injection_probability = 0.0;

INSERT INTO t_detach_attach_patches;

INSERT INTO t_detach_attach_patches;

INSERT INTO t_detach_attach_patches;

INSERT INTO t_detach_attach_patches;

INSERT INTO t_detach_attach_patches;

INSERT INTO t_detach_attach_patches;

SELECT *
FROM t_detach_attach_patches
ORDER BY `ALL` ASC;

SET apply_patch_parts = 0;

SYSTEM DROP  TABLE t_detach_attach_patches SYNC;

SYSTEM DROP  TABLE t_detach_attach_patches_dst SYNC;