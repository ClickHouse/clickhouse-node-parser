CREATE TABLE t_block_offset (id UInt32) ENGINE = MergeTree ORDER BY id SETTINGS index_granularity = 3, enable_block_number_column = 0, enable_block_offset_column = 0;
INSERT INTO t_block_offset SELECT number * 2 FROM numbers(8);
INSERT INTO t_block_offset SELECT number * 2 FROM numbers(8, 8);
SELECT _part, _block_number, _block_offset, _part_offset, id FROM t_block_offset ORDER BY _block_number, _block_offset;
INSERT INTO t_block_offset SELECT number * 2 + 1 FROM numbers(16);
