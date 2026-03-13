SELECT *
FROM dist_01528
WHERE dummy = 2; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

SELECT *
FROM dist_01528
WHERE dummy = 2
SETTINGS allow_nondeterministic_optimize_skip_unused_shards = 1;