CREATE TABLE test_input(id Int32) ENGINE=MergeTree() order by id;
CREATE TABLE test(`id` Int32, `pv` AggregateFunction(sum, Int32)) ENGINE = AggregatingMergeTree() ORDER BY id;
CREATE MATERIALIZED VIEW test_mv to test(`id` Int32, `pv` AggregateFunction(sum, Int32)) as SELECT id, sumState(1) as pv from test_input group by id; -- { serverError CANNOT_CONVERT_TYPE }
select '----------test--------:';
select * from test;
create MATERIALIZED VIEW test_mv to test(`id` Int32, `pv` AggregateFunction(sum, Int32)) as SELECT id, sumState(toInt32(1)) as pv from test_input group by id;
