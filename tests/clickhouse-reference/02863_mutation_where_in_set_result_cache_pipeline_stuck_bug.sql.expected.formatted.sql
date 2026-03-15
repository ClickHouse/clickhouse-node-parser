CREATE TABLE tab
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x;

SET mutations_sync = 2;