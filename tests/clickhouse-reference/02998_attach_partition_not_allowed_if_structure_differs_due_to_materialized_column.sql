CREATE TABLE attach_partition_t7 (
                                     a UInt32,
                                     b UInt32
)
    ENGINE = MergeTree
PARTITION BY a ORDER BY a;
CREATE TABLE attach_partition_t8 (
                                     a UInt32,
                                     b UInt32
)
    ENGINE = MergeTree
PARTITION BY a ORDER BY a;
