create table data_01292 (
    key Int,
    index key_idx (key) type minmax granularity 1
) Engine=MergeTree() ORDER BY (key+0);
insert into data_01292 values (1);
select * from data_01292 where key > 0;
