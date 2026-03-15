CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE `02577_keepermap_delete_update`
(
    key UInt64,
    value String,
    value2 UInt64
)
PRIMARY KEY key;