create table data (key SimpleAggregateFunction(max, Int)) engine=AggregatingMergeTree() order by tuple();
insert into data values (0);
select * from data final prewhere indexHint(_partition_id = 'all') and key >= -1 where key >= 0;
