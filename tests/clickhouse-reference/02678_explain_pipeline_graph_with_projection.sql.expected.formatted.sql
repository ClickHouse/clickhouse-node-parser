CREATE TABLE t1
(
    ID UInt64,
    name String
)
ENGINE = MergeTree
ORDER BY ID;

INSERT INTO t1 (ID, name);