set allow_suspicious_primary_key = 0;
create table data (key Int, value AggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() order by (key, value); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
create table data (key Int, value SimpleAggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() order by (key, value); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
create table data (key Int, value AggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() primary key value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
create table data (key Int, value SimpleAggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() primary key value; -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
create table data (key Int, value AggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() primary key value order by (value, key); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
create table data (key Int, value SimpleAggregateFunction(sum, UInt64)) engine=AggregatingMergeTree() primary key value order by (value, key); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
set allow_suspicious_primary_key = 1;
-- ALTER AggregatingMergeTree
create table data (key Int) engine=AggregatingMergeTree() order by (key);
-- ALTER ReplicatedAggregatingMergeTree
create table data_rep (key Int) engine=ReplicatedAggregatingMergeTree('/tables/{database}', 'r1') order by (key);
