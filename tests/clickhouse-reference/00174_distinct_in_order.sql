-- Tags: stateful
select '-- check that distinct with and w/o optimization produce the same result';
create table distinct_in_order (CounterID UInt32, EventDate Date) engine=MergeTree() order by (CounterID, EventDate) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table ordinary_distinct (CounterID UInt32, EventDate Date) engine=MergeTree() order by (CounterID, EventDate) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select distinct * from distinct_in_order except select * from ordinary_distinct;
