SELECT *
FROM data_02000
WHERE key = 0xdeadbeafdeadbeaf;

SELECT *
FROM dist_02000
WHERE key = 0xdeadbeafdeadbeaf
SETTINGS force_optimize_skip_unused_shards = 2; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS, CANNOT_CONVERT_TYPE }

SELECT *
FROM dist_02000
WHERE key = 0xdeadbeafdeadbeaf;