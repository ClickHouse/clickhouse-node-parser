select * from dist_01528 where dummy = 2; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist_01528 where dummy = 2 settings allow_nondeterministic_optimize_skip_unused_shards=1;
