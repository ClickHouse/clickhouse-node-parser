SET enable_lightweight_update = 1;

CREATE TABLE t_lwu_sequence
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY a
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1, apply_patches_on_merge = 1, shared_merge_tree_disable_merges_and_mutations_assignment = 1;

SELECT b
FROM t_lwu_sequence
WHERE a = 5
SETTINGS apply_patch_parts = 0;

SELECT b
FROM t_lwu_sequence
WHERE a = 5
SETTINGS apply_patch_parts = 1;

SELECT
    count(),
    sum(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_lwu_sequence'
    AND startsWith(name, 'patch')
    AND active;