-- Tags: zookeeper, no-replicated-database, no-parallel, no-object-storage
SYSTEM drop  table if exists x;

CREATE TABLE x
(
    i int,
    INDEX mm LOG2(i) TYPE minmax GRANULARITY 1,
    PROJECTION p (    SELECT MAX(i))
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/x', 'r')
ORDER BY i;

SELECT value
FROM `system`.zookeeper
WHERE name = 'metadata'
    AND path = concat('/clickhouse/tables/', currentDatabase(), '/x');

SYSTEM drop  table x;