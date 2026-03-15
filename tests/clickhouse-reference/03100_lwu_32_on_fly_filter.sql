SET enable_lightweight_update=1;
CREATE TABLE lwu_on_fly (id UInt64, u UInt64, s String)
ENGINE = MergeTree
ORDER BY id PARTITION BY id % 2
SETTINGS
    enable_block_number_column = 1,
    enable_block_offset_column = 1,
    apply_patches_on_merge = 1;
SELECT * FROM lwu_on_fly ORDER BY id settings apply_mutations_on_fly = 1, apply_patch_parts = 1;
SELECT count() FROM lwu_on_fly WHERE NOT ignore(*) SETTINGS apply_mutations_on_fly = 1, apply_patch_parts = 1;
