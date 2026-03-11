select value from system.zookeeper WHERE name = 'metadata' and path = '/clickhouse/tables/'||currentDatabase()||'/x';
