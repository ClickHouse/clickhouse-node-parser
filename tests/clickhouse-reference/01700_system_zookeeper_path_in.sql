SELECT name FROM system.zookeeper WHERE path = '/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard') AND name like 'block%' ORDER BY name;
SELECT 'r1' FROM system.zookeeper WHERE path = '/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard') || '/replicas' AND name LIKE '%'|| getMacro('replica') ||'%' ORDER BY name;
SELECT name FROM system.zookeeper WHERE path IN ('/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard')) AND name LIKE 'block%' ORDER BY name;
SELECT 'r1' FROM system.zookeeper WHERE path IN ('/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard') || '/replicas') AND name LIKE '%' || getMacro('replica') || '%' ORDER BY name;
SELECT name FROM system.zookeeper WHERE path IN ('/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard'),
                                                 '/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard') || '/replicas') AND name LIKE 'block%' ORDER BY name;
SELECT name FROM system.zookeeper WHERE path IN (SELECT concat('/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard') || '/', name)
    FROM system.zookeeper WHERE (name != 'replicas' AND name NOT LIKE 'leader_election%' AND name NOT LIKE 'zero_copy_%' AND path = '/clickhouse/' || currentDatabase() || '/01700_system_zookeeper_path_in/' || getMacro('shard'))) ORDER BY name;
