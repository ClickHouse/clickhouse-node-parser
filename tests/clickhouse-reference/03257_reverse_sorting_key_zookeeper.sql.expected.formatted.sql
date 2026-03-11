SELECT value
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/tables/', currentDatabase(), '/x1')
    AND name = 'metadata';

SELECT value
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/tables/', currentDatabase(), '/x2')
    AND name = 'metadata';