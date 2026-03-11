SELECT like(engine_full, ('%replica-{server_uuid}%'))
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'test';

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/tables/', currentDatabase(), '/test/s1/replicas/')
    AND like(name, concat('replica-', serverUUID()::String, '%'));

SELECT getMacro('server_uuid');