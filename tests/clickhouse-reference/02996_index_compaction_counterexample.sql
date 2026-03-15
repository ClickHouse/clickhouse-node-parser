create table b (x Int64, y String) engine MergeTree order by (x, y) settings index_granularity=2;
select count() from b where x = 1 and y = 'b';
