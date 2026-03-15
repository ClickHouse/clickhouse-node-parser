create table partial_sort_opt_bug (x UInt64) engine = MergeTree order by tuple() settings index_granularity = 1000;
select x from partial_sort_opt_bug order by x limit 2000 settings max_block_size = 4000;
