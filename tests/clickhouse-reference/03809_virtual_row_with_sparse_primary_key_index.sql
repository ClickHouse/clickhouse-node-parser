-- Create table with composite primary key
CREATE TABLE t_virtual_row_sparse_pk (a UInt64, b UInt64, c String)
ENGINE = MergeTree()
ORDER BY (a, b)
SETTINGS index_granularity = 8192;
-- Insert enough data to have multiple marks (10 marks = 81920 rows with granularity 8192)
-- Use sequential numbers so column 'a' has 100% unique values at mark boundaries,
-- which triggers the index optimization to drop column 'b'
INSERT INTO t_virtual_row_sparse_pk SELECT number, number, 'data' FROM numbers(81920);
-- This query uses read_in_order_use_virtual_row optimization
-- It should work even when the index doesn't have all primary key columns
SELECT a, b FROM t_virtual_row_sparse_pk ORDER BY (a, b) LIMIT 5 SETTINGS read_in_order_use_virtual_row = 1;
-- Also test with PREWHERE which may take a different code path
SELECT a, b FROM t_virtual_row_sparse_pk PREWHERE a < 100000 ORDER BY (a, b) LIMIT 5 SETTINGS read_in_order_use_virtual_row = 1;
-- Test descending order
SELECT a, b FROM t_virtual_row_sparse_pk ORDER BY (a, b) DESC LIMIT 5 SETTINGS read_in_order_use_virtual_row = 1;
-- Verify the total count is correct
SELECT count() FROM t_virtual_row_sparse_pk;
