CREATE TABLE t1
(
    ID UInt64,
    name String
)
ENGINE = MergeTree
ORDER BY ID;