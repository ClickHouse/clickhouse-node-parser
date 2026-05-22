-- Tags: zookeeper, no-parallel, no-fasttest, long
SET allow_unrestricted_reads_from_keeper = 'false';

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

SET allow_unrestricted_reads_from_keeper = 'true';

SET allow_unrestricted_reads_from_keeper = DEFAULT;

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'unknown'; -- { serverError BAD_ARGUMENTS }

SELECT count() > 0
FROM `system`.zookeeper
WHERE path = '/'
    AND zookeeperName = 'default';