SET enable_lightweight_update = 1;

CREATE TABLE t_lwu_merges
(
    id UInt64,
    u UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_lwu_merges/', '1')
ORDER BY id
PARTITION BY id % 2
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, apply_patches_on_merge = 1, shared_merge_tree_disable_merges_and_mutations_assignment = 1, max_replicated_mutations_in_queue = 0;

SELECT
    sum(u),
    countIf(endsWith(s, '_foo'))
FROM t_lwu_merges
SETTINGS apply_patch_parts = 0;

SELECT
    sum(u),
    countIf(endsWith(s, '_foo'))
FROM t_lwu_merges
SETTINGS apply_patch_parts = 1;