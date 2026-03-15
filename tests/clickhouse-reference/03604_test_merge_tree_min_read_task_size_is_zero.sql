SET allow_experimental_lightweight_update = 1;
-- catch error BAD_ARGUMENTS
SET merge_tree_min_read_task_size = 0; -- { serverError BAD_ARGUMENTS }
CREATE TABLE `03604_test` (c0 Int)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;
