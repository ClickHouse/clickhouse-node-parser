create table nullable_set_index (a UInt64, b Nullable(String), INDEX b_index b TYPE set(0) GRANULARITY 8192) engine = MergeTree order by a;
select * from nullable_set_index where b = 'a';
select * from nullable_set_index where b = 'b';
select * from nullable_set_index where b = 'c';
select '--';
create table nullable_set_index (a UInt64, b Nullable(String), INDEX b_index b TYPE set(1) GRANULARITY 8192) engine = MergeTree order by a;
create table nullable_set_index (a UInt64, b LowCardinality(Nullable(String)), INDEX b_index b TYPE set(0) GRANULARITY 8192) engine = MergeTree order by a;
create table nullable_set_index (a UInt64, b LowCardinality(Nullable(String)), INDEX b_index b TYPE set(1) GRANULARITY 8192) engine = MergeTree order by a;
