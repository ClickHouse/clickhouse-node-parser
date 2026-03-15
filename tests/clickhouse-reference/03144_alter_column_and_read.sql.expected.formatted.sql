CREATE TABLE tab
(
    x UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

SET alter_sync = 0;

SELECT
    x,
    y
FROM tab
ORDER BY x ASC;