CREATE TABLE table_for_synchronous_mutations1
(
    k UInt32,
    v1 UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01049/table_for_synchronous_mutations', '1')
ORDER BY k
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE table_for_synchronous_mutations2
(
    k UInt32,
    v1 UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01049/table_for_synchronous_mutations', '2')
ORDER BY k
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'table_for_synchronous_mutations1';

CREATE TABLE table_for_synchronous_mutations_no_replication
(
    k UInt32,
    v1 UInt64
)
ENGINE = MergeTree
ORDER BY k
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT is_done
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'table_for_synchronous_mutations_no_replication';