-- 1 shard

SELECT '-- 1 shard, 3 replicas';
SELECT count(), min(id), max(id), avg(id)
FROM test_d;
SELECT count(), min(id), max(id), avg(id)
FROM test2_d;
