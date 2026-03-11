SELECT t1._shard_num % t1._shard_num
FROM
    t1
FULL JOIN (
        SELECT 1 AS c0
    ) AS tx
    ON true;

SELECT t1._shard_num % shardNum()
FROM
    t1
FULL JOIN (
        SELECT 1 AS c0
    ) AS tx
    ON true;