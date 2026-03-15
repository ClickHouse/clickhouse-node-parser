CREATE TABLE tbl (
    a UInt64,
    b UInt64
) 
ENGINE = MergeTree()
ORDER BY (a, b)
SETTINGS index_granularity = 8192;
SELECT
    a,
    b
FROM tbl
ORDER BY (a, b)
SETTINGS read_in_order_use_virtual_row = 1
FORMAT Hash;
