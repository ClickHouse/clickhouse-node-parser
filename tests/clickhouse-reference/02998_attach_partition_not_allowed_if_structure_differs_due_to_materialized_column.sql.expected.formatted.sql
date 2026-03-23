CREATE TABLE attach_partition_t7
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a;

INSERT INTO attach_partition_t7;

CREATE TABLE attach_partition_t8
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a;