create table tab (d Int64, s AggregateFunction(groupUniqArrayArray, Array(UInt64)), c SimpleAggregateFunction(groupUniqArrayArray, Array(UInt64))) engine = SummingMergeTree() order by d;
