create table lc_00800_1 (names Array(LowCardinality(String))) engine=MergeTree order by tuple();
insert into lc_00800_1 values ([]);
insert into lc_00800_1 select emptyArrayString();
select * from lc_00800_1;
