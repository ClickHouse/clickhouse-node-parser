SELECT
    a,
    b
FROM tbl
ORDER BY (a, b) ASC
SETTINGS read_in_order_use_virtual_row = 1
FORMAT Hash;