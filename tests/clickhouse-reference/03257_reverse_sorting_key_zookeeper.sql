select value from system.zookeeper where path = '/clickhouse/tables/' || currentDatabase() || '/x1' and name = 'metadata';
select value from system.zookeeper where path = '/clickhouse/tables/' || currentDatabase() || '/x2' and name = 'metadata';
