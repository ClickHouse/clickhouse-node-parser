SELECT
    'view' AS src,
    *
FROM TestTbl_view;

SELECT
    'dict' AS src,
    *
FROM TestTblDict;

SELECT sleep(3)
FROM numbers(4)
SETTINGS max_block_size = 1
FORMAT Null;