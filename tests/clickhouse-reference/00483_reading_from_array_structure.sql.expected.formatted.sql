SELECT
    blockSize(),
    *
FROM table_00483
PREWHERE `Struct.Key1`[1] = 19
    AND `Struct.Key2`[1] >= 0
FORMAT Null;

SELECT
    blockSize(),
    *
FROM table_00483
PREWHERE x = 7
FORMAT Null;