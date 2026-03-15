set allow_suspicious_low_cardinality_types = 1;
create table t1 (id LowCardinality(Nullable(Int64))) engine MergeTree order by id settings allow_nullable_key = 1, index_granularity = 1;
select * from t1 where id = 21585718595728998;
