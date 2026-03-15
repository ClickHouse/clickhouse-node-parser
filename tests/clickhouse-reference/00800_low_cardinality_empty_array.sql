create table lc_00800_1 (names Array(LowCardinality(String))) engine=MergeTree order by tuple();
select * from lc_00800_1;
