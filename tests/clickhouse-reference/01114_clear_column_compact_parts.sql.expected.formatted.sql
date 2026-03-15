CREATE TABLE clear_column
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY x;

SELECT *
FROM clear_column
ORDER BY x ASC;