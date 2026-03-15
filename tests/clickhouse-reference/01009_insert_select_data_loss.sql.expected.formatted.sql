CREATE TABLE tab
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM tab
ORDER BY x ASC;