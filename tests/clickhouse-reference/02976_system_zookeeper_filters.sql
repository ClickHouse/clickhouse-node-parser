SELECT count() > 0 FROM system.zookeeper; -- { serverError BAD_ARGUMENTS }
SELECT count() > 0 FROM system.zookeeper WHERE name LIKE '%_%'; -- { serverError BAD_ARGUMENTS }
SELECT count() > 0 FROM system.zookeeper WHERE value LIKE '%'; -- { serverError BAD_ARGUMENTS }
SELECT count() > 0 FROM system.zookeeper WHERE path LIKE '/%'; -- { serverError BAD_ARGUMENTS }
SELECT count() > 0 FROM system.zookeeper WHERE path = '/';
SELECT count() > 0 FROM system.zookeeper WHERE path = '/' AND zookeeperName  = 'unknown'; -- { serverError BAD_ARGUMENTS }
SELECT count() > 0 FROM system.zookeeper WHERE path = '/' AND zookeeperName  = 'default';
