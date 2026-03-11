SELECT
    a,
    b
FROM tbl
ORDER BY (a, b)
SETTINGS read_in_order_use_virtual_row = 1
FORMAT Hash;
