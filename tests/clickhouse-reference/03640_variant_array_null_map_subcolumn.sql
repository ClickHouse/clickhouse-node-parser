create table test (v Variant(Array(Nullable(String)))) engine=MergeTree order by tuple();
select v.`Array(Nullable(String))`.null from test;
