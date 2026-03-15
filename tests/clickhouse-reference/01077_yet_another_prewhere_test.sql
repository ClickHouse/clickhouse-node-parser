create table t50 (a Int, b Int, s String) engine = MergeTree order by a settings index_granularity = 50, index_granularity_bytes=1000, min_index_granularity_bytes=500;
select a, b from t50 prewhere b = 1 order by a;
