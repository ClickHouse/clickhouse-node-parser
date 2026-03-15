-- Tags: distributed
create table table_1 (x UInt32, y String, INDEX a (length(y)) TYPE minmax GRANULARITY 1) engine = MergeTree order by x settings index_granularity = 2;
CREATE TABLE distr_table (x UInt32, y String) ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), 'table_1');
-- { echoOn }
set max_rows_to_read = 2;
select * from table_1 order by x settings additional_table_filters={'table_1' : 'x > 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'x < 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'length(y) >= 3'};
select * from table_1 order by x settings additional_table_filters={'table_1' : 'length(y) < 3'};
set max_rows_to_read = 4;
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'x > 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'x < 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'length(y) > 3'};
select * from distr_table order by x settings additional_table_filters={'distr_table' : 'length(y) < 3'};
