create table ay engine AggregatingMergeTree order by i as select 1 i, sumSimpleState(10) group by i;
select * from ay;
