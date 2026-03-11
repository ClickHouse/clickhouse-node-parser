select * from dist_01071;
select * from dist_01071 where key = 0; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
select * from dist2_01071 where key = 1; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }
