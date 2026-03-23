CREATE TABLE t (x Int32) ENGINE = MergeTree ORDER BY x;
CREATE TABLE t2 (x Int32) ENGINE = MergeTree ORDER BY x;
SET max_insert_block_size = 1;
SET min_insert_block_size_rows = 1;
SET max_block_size = 1;
SET max_parts_to_move = 5;
INSERT INTO t SELECT number from numbers(10);
SET max_parts_to_move = 15;
