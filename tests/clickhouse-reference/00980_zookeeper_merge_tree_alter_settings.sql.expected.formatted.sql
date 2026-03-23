SET replication_alter_partitions_sync = 2;

CREATE TABLE replicated_table_for_alter1
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00980_{database}/replicated_table_for_alter', '1')
ORDER BY id;

CREATE TABLE replicated_table_for_alter2
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00980_{database}/replicated_table_for_alter', '2')
ORDER BY id;

INSERT INTO replicated_table_for_alter2;

INSERT INTO replicated_table_for_alter1;

SELECT COUNT()
FROM replicated_table_for_alter1;

SELECT COUNT()
FROM replicated_table_for_alter2;

INSERT INTO replicated_table_for_alter2; -- { serverError TOO_MANY_PARTS }

INSERT INTO replicated_table_for_alter1;

CREATE TABLE replicated_table_for_reset_setting1
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00980_{database}/replicated_table_for_reset_setting', '1')
ORDER BY id;

CREATE TABLE replicated_table_for_reset_setting2
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00980_{database}/replicated_table_for_reset_setting', '2')
ORDER BY id;