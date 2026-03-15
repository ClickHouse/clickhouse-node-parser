-- Tags: zookeeper

set allow_unrestricted_reads_from_keeper = 'true';
create table test_zkinsert (
	name String,
	path String,
	value String
) ENGINE Memory;
SELECT * FROM (SELECT path, name, value FROM system.zookeeper ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/1-insert-test%';
SELECT '-------------------------';
SELECT * FROM (SELECT path, name, value FROM system.zookeeper ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/2-insert-test%';
create table test_zkinsert (
	name String,
	path String,
	value String,
	zookeeperName String default 'zookeeper2'
) ENGINE Memory;
SELECT * FROM (SELECT path, name, value FROM system.zookeeper WHERE zookeeperName = 'zookeeper2' ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/1-insert-test%';
SELECT * FROM (SELECT path, name, value FROM system.zookeeper WHERE zookeeperName = 'zookeeper2' ORDER BY path, name) WHERE path LIKE '/' || currentDatabase() || '/2-insert-test%';
