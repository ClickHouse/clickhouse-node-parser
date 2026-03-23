-- Tags: zookeeper

DROP TABLE IF EXISTS broken_partition;
CREATE TABLE broken_partition
(
    date Date,
    key UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/test_01925_{database}/rmt', 'r1')
ORDER BY tuple()
PARTITION BY date;
DROP TABLE IF EXISTS old_partition_key;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE old_partition_key (sd Date, dh UInt64, ak UInt32, ed Date) ENGINE=MergeTree(sd, dh, (ak, ed, dh), 8192);
DROP TABLE old_partition_key;
