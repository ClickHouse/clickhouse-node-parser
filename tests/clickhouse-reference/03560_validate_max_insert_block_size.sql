CREATE TABLE t (n Int) ENGINE = MergeTree ORDER BY n SETTINGS merge_max_block_size = 0; -- { serverError BAD_ARGUMENTS }
CREATE TABLE t (n Int) ENGINE = MergeTree ORDER BY n SETTINGS merge_max_block_size = 1;
