CREATE TABLE test_array_joins
(
    id UInt64 DEFAULT rowNumberInAllBlocks() + 1,
    arr_1 Array(String),
    arr_2 Array(String),
    arr_3 Array(String),
    arr_4 Array(String)
)
ENGINE = MergeTree
ORDER BY id;

CREATE VIEW v4test_array_joins
AS
SELECT *
FROM test_array_joins
WHERE id != 10;

SELECT *
FROM
    v4test_array_joins
ARRAY JOIN columns('^arr')
WHERE match(arr_4, 'a')
    AND id < 100
ORDER BY id ASC
FORMAT Null
SETTINGS optimize_read_in_order = 0;