SELECT * FROM (SELECT path, name, value FROM system.zookeeper ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/1-insert-test%';
SELECT '-------------------------';
SELECT * FROM (SELECT path, name, value FROM system.zookeeper ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/2-insert-test%';
SELECT * FROM (SELECT path, name, value FROM system.zookeeper WHERE zookeeperName = 'zookeeper2' ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/1-insert-test%';
SELECT * FROM (SELECT path, name, value FROM system.zookeeper WHERE zookeeperName = 'zookeeper2' ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/2-insert-test%';
