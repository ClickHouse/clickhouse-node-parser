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