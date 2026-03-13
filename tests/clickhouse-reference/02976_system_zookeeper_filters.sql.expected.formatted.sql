SELECT count() > 0
FROM `system`.zookeeper; -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(name, '%_%'); -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(value, '%'); -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE like(path, '/%'); -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/';

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'unknown'; -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'default';