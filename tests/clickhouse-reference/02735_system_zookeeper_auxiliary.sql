SELECT DISTINCT zookeeperName FROM system.zookeeper WHERE path = '/' AND zookeeperName = 'default';
SELECT DISTINCT zookeeperName FROM system.zookeeper WHERE path = '/' AND zookeeperName = 'zookeeper2';
SELECT count() FROM system.zookeeper WHERE path IN '/' AND zookeeperName = 'zookeeper3'; -- { serverError BAD_ARGUMENTS }
SELECT count() = 0 FROM system.zookeeper WHERE path IN '/' AND zookeeperName = 'default' AND zookeeperName = 'zookeeper2';
SELECT count() > 0 FROM system.zookeeper WHERE path IN '/' AND zookeeperName = 'zookeeper2' AND zookeeperName = 'zookeeper2';
