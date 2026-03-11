SELECT
    shardNum() AS shard_num,
    sum(1) AS `rows`
FROM remote('127.{1,2}', `system`, one)
GROUP BY _shard_num
ORDER BY _shard_num ASC;

SELECT
    shardNum() AS shard_num,
    sum(1) AS `rows`
FROM remote('127.{1,2}', `system`, one)
GROUP BY shard_num
ORDER BY shard_num ASC;

SELECT
    _shard_num AS shard_num,
    sum(1) AS `rows`
FROM remote('127.{1,2}', `system`, one)
GROUP BY _shard_num
ORDER BY _shard_num ASC;

SELECT
    _shard_num AS shard_num,
    sum(1) AS `rows`
FROM remote('127.{1,2}', `system`, one)
GROUP BY shard_num
ORDER BY shard_num ASC;

SELECT
    a._shard_num AS shard_num,
    sum(1) AS `rows`
FROM remote('127.{1,2}', `system`, one) AS a
GROUP BY shard_num
ORDER BY shard_num ASC;

SELECT _shard_num
FROM
    remote('127.1', `system`.one) AS a
INNER JOIN (
        SELECT _shard_num
        FROM `system`.one
    ) AS b
    USING (dummy);