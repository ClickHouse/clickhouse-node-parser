create table cardinality (x String) engine = MergeTree order by tuple();
insert into cardinality (x) select concat('v', toString(number)) from numbers(10);
select * from cardinality;
