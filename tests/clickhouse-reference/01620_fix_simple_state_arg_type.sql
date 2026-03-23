create table ay engine AggregatingMergeTree order by i as select 1 i, sumSimpleState(10) group by i;
insert into ay values(40, 60);
insert into ay values(40, 50);
insert into ay values(20, 30);
select * from ay;
insert into ay values(20, 30), (40, 10);
