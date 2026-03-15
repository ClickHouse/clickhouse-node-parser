CREATE TABLE validate_setting_merge_max_block_size
(
    x Int64
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS merge_max_block_size = 0; -- {serverError BAD_ARGUMENTS}

CREATE TABLE validate_setting_merge_max_block_size
(
    x Int64
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS merge_max_block_size = 1;