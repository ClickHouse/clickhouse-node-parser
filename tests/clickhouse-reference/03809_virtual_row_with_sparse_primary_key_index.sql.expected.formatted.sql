SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
ORDER BY (a, b) ASC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
PREWHERE a < 100000
ORDER BY (a, b) ASC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

SELECT
    a,
    b
FROM t_virtual_row_sparse_pk
ORDER BY (a, b) DESC
LIMIT 5
SETTINGS read_in_order_use_virtual_row = 1;

SELECT count()
FROM t_virtual_row_sparse_pk;