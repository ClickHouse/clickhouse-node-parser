SELECT count() != 0
FROM shard_0.tbl;

SELECT count() != 0
FROM shard_1.tbl;

SELECT *
FROM distr
ORDER BY number ASC
LIMIT 20;