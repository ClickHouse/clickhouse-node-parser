SET mutations_sync = 2;

SYSTEM DROP  TABLE IF EXISTS rep_data;

CREATE TABLE rep_data
(
    p Int,
    t DateTime,
    INDEX idx t TYPE minmax GRANULARITY 1
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/rep_data', '1')
ORDER BY t
PARTITION BY p
SETTINGS number_of_free_entries_in_pool_to_execute_mutation = 0;

INSERT INTO rep_data;

SYSTEM DROP  TABLE IF EXISTS data;

CREATE TABLE data
(
    p Int,
    t DateTime,
    INDEX idx t TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY t
PARTITION BY p
SETTINGS number_of_free_entries_in_pool_to_execute_mutation = 0;

INSERT INTO data;