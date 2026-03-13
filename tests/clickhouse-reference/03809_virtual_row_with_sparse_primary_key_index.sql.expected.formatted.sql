-- This query uses read_in_order_use_virtual_row optimization
-- It should work even when the index doesn't have all primary key columns
SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
ORDER BY (a, b) ASC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

-- Also test with PREWHERE which may take a different code path
SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
PREWHERE a < 100000
ORDER BY (a, b) ASC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

-- Test descending order
SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
ORDER BY (a, b) DESC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

-- Verify the total count is correct
SELECT count()
FROM t_virtual_row_sparse_pk;