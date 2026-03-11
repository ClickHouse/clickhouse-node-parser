SELECT
    max(blockSize()),
    min(blockSize()),
    any(ignore(*))
FROM tab_00484;

SELECT
    blockSize(),
    *
FROM tab_00484
WHERE x = 1
    OR x > 36
FORMAT Null;

SELECT s
FROM tab_00484
WHERE s == ''
FORMAT Null;

SELECT count(*)
FROM tab_00484
PREWHERE s != 'abc'
FORMAT Null;

SELECT count(*)
FROM tab_00484
PREWHERE s = 'abc'
FORMAT Null;