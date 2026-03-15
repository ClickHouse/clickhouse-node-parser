CREATE TABLE t0 (c0 Array(Tuple())) ENGINE = Memory;
SET max_insert_block_size = 4;
SELECT [(), ()];
