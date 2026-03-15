create table test_quantile (x AggregateFunction(quantileTiming(0.2), UInt64)) engine = Memory;
select y from (
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile union all
select finalizeAggregation(x) as y from test_quantile)
order by y;
