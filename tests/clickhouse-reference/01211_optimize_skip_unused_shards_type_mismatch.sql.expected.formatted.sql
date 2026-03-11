SELECT *
FROM data_02000
WHERE key = 0xdeadbeafdeadbeaf;

SELECT *
FROM dist_02000
WHERE key = 0xdeadbeafdeadbeaf
SETTINGS force_optimize_skip_unused_shards = 2;

SELECT *
FROM dist_02000
WHERE key = 0xdeadbeafdeadbeaf;