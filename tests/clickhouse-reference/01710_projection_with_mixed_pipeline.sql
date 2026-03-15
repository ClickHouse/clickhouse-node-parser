create table t (x UInt32) engine = MergeTree order by tuple() settings index_granularity = 8;
select uniqHLL12(x) from t settings optimize_use_projections = 1, max_bytes_to_read=400, max_block_size=8; -- { serverError TOO_MANY_BYTES }
