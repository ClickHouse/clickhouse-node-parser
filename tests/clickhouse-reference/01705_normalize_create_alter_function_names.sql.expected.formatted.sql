SELECT value
FROM `system`.zookeeper
WHERE name = 'metadata'
    AND path = concat('/clickhouse/tables/', currentDatabase(), '/x');