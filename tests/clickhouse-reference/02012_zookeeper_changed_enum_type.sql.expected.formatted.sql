-- Tags: zookeeper, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards
CREATE TABLE enum_alter_issue
(
    a Enum8('one' = 1, 'two' = 2),
    b Int
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02012/enum_alter_issue', 'r1')
ORDER BY a;

SELECT *
FROM enum_alter_issue
ORDER BY b ASC;