set deduplicate_blocks_in_dependent_materialized_views=0;
CREATE TABLE test (test String, A Int64, B Int64) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
ORDER BY tuple();
CREATE MATERIALIZED VIEW test_mv_a Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
order by tuple() AS SELECT test, A, count() c FROM test group by test, A;
CREATE MATERIALIZED VIEW test_mv_b Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
partition by A order by tuple() AS SELECT test, A, count() c FROM test group by test, A;
CREATE MATERIALIZED VIEW test_mv_c Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/test_02124/{table}', '1')
order by tuple() AS SELECT test, A, count() c FROM test group by test, A;
SET max_partitions_per_insert_block = 1;
SET max_partitions_per_insert_block = 0;
select
  (select count() from test where test='case1'),
  (select sum(c) from test_mv_a where test='case1'),
  (select sum(c) from test_mv_b where test='case1'),
  (select sum(c) from test_mv_c where test='case1');
set deduplicate_blocks_in_dependent_materialized_views=1;
select
  (select count() from test where test='case2'),
  (select sum(c) from test_mv_a where test='case2'),
  (select sum(c) from test_mv_b where test='case2'),
  (select sum(c) from test_mv_c where test='case2');
select
  (select count() from test where test='case3'),
  (select sum(c) from test_mv_a where test='case3'),
  (select sum(c) from test_mv_b where test='case3'),
  (select sum(c) from test_mv_c where test='case3');
select
  (select count() from test where test='case4'),
  (select sum(c) from test_mv_a where test='case4'),
  (select sum(c) from test_mv_b where test='case4'),
  (select sum(c) from test_mv_c where test='case4');
