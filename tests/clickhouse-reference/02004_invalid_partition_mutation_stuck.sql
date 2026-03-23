SET mutations_sync=2;
CREATE TABLE rep_data
(
    p Int,
    t DateTime,
    INDEX idx t TYPE minmax GRANULARITY 1
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/rep_data', '1')
PARTITION BY p
ORDER BY t
SETTINGS number_of_free_entries_in_pool_to_execute_mutation=0;
INSERT INTO rep_data VALUES (1, now());
CREATE TABLE data
(
    p Int,
    t DateTime,
    INDEX idx t TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
PARTITION BY p
ORDER BY t
SETTINGS number_of_free_entries_in_pool_to_execute_mutation=0;
INSERT INTO data VALUES (1, now());
