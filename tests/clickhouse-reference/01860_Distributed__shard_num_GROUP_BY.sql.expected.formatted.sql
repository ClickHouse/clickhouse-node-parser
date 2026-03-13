-- Tags: shard
-- GROUP BY _shard_num
SELECT
    _shard_num,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num
ORDER BY _shard_num ASC;

SELECT
    _shard_num AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num
ORDER BY _shard_num ASC;

SELECT
    _shard_num + 1,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num + 1
ORDER BY _shard_num + 1 ASC;

SELECT
    _shard_num + 1 AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num + 1
ORDER BY _shard_num + 1 ASC;

SELECT
    _shard_num + dummy,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num + dummy
ORDER BY _shard_num + dummy ASC;

SELECT
    _shard_num + dummy AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY _shard_num + dummy
ORDER BY _shard_num + dummy ASC;

SELECT _shard_num
FROM remote('127.0.0.{1,2}', `system`.one)
ORDER BY _shard_num ASC;

SELECT _shard_num AS s
FROM remote('127.0.0.{1,2}', `system`.one)
ORDER BY _shard_num ASC;