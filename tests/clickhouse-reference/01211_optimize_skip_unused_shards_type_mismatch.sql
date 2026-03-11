select * from data_02000 where key = 0xdeadbeafdeadbeaf;
select * from dist_02000 where key = 0xdeadbeafdeadbeaf settings force_optimize_skip_unused_shards=2; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS, CANNOT_CONVERT_TYPE }
select * from dist_02000 where key = 0xdeadbeafdeadbeaf;
