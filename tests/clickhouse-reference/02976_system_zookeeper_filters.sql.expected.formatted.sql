SELECT count() > 0
FROM `system`.zookeeper;

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(name, '%_%');

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(value, '%');

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(path, '/%');

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/';

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'unknown';

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'default';