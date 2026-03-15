-- Tags: zookeeper
SET allow_unrestricted_reads_from_keeper = 'true';

CREATE TABLE test_zkinsert
(
    name String,
    path String,
    value String
)
ENGINE = Memory;

SELECT *
FROM (
        SELECT
            path,
            name,
            value
        FROM `system`.zookeeper
        ORDER BY
            path ASC,
            name ASC
    )
WHERE like(path, concat('/', currentDatabase(), '/1-insert-test%'));

SELECT '-------------------------';

SELECT *
FROM (
        SELECT
            path,
            name,
            value
        FROM `system`.zookeeper
        ORDER BY
            path ASC,
            name ASC
    )
WHERE like(path, concat('/', currentDatabase(), '/2-insert-test%'));

CREATE TABLE test_zkinsert
(
    name String,
    path String,
    value String,
    zookeeperName String DEFAULT 'zookeeper2'
)
ENGINE = Memory;

SELECT *
FROM (
        SELECT
            path,
            name,
            value
        FROM `system`.zookeeper
        WHERE zookeeperName = 'zookeeper2'
        ORDER BY
            path ASC,
            name ASC
    )
WHERE like(path, concat('/', currentDatabase(), '/1-insert-test%'));

SELECT *
FROM (
        SELECT
            path,
            name,
            value
        FROM `system`.zookeeper
        WHERE zookeeperName = 'zookeeper2'
        ORDER BY
            path ASC,
            name ASC
    )
WHERE like(path, concat('/', currentDatabase(), '/2-insert-test%'));