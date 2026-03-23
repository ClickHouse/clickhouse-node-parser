-- Tags: zookeeper, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards
SYSTEM drop  table if exists enum_alter_issue;

CREATE TABLE enum_alter_issue
(
    a Enum16('one' = 1, 'two' = 2),
    b Int
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02012/enum_alter_issue', 'r2')
ORDER BY b;

INSERT INTO enum_alter_issue;

SELECT *
FROM enum_alter_issue;

SYSTEM drop  table enum_alter_issue;