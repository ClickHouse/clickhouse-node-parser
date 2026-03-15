create table cardinality (x String) engine = MergeTree order by tuple();
select * from cardinality;
