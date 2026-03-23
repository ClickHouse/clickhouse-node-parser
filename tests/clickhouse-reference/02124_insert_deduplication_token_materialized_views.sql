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
INSERT INTO test SELECT 'case1', number%3, 1 FROM numbers(9) ORDER BY ALL SETTINGS materialized_views_ignore_errors=1;
SET max_partitions_per_insert_block = 0;
INSERT INTO test SELECT 'case1', number%3, 1 FROM numbers(9) ORDER BY ALL;
INSERT INTO test SELECT 'case1', number%3, 2 FROM numbers(9) ORDER BY ALL;
select
  (select count() from test where test='case1'),
  (select sum(c) from test_mv_a where test='case1'),
  (select sum(c) from test_mv_b where test='case1'),
  (select sum(c) from test_mv_c where test='case1');
set deduplicate_blocks_in_dependent_materialized_views=1;
INSERT INTO test SELECT 'case2', number%3, 1 FROM numbers(9) ORDER BY ALL SETTINGS materialized_views_ignore_errors=1;
INSERT INTO test SELECT 'case2', number%3, 1 FROM numbers(9) ORDER BY ALL;
INSERT INTO test SELECT 'case2', number%3, 2 FROM numbers(9) ORDER BY ALL;
select
  (select count() from test where test='case2'),
  (select sum(c) from test_mv_a where test='case2'),
  (select sum(c) from test_mv_b where test='case2'),
  (select sum(c) from test_mv_c where test='case2');
INSERT INTO test SELECT 'case3', number%3, 1 FROM numbers(9) ORDER BY ALL SETTINGS insert_deduplication_token = 'case3test1', materialized_views_ignore_errors=1;
INSERT INTO test SELECT 'case3', number%3, 1 FROM numbers(9) ORDER BY ALL SETTINGS insert_deduplication_token = 'case3test1';
INSERT INTO test SELECT 'case3', number%3, 2 FROM numbers(9) ORDER BY ALL SETTINGS insert_deduplication_token = 'case3test2';
select
  (select count() from test where test='case3'),
  (select sum(c) from test_mv_a where test='case3'),
  (select sum(c) from test_mv_b where test='case3'),
  (select sum(c) from test_mv_c where test='case3');
INSERT INTO test SELECT 'case4', number%3, 1 FROM numbers(9) ORDER BY ALL SETTINGS insert_deduplication_token = 'case4test1' ; -- { serverError TOO_MANY_PARTS }
INSERT INTO test SELECT 'case4', number%3, 2 FROM numbers(9) ORDER BY ALL SETTINGS insert_deduplication_token = 'case4test2';
select
  (select count() from test where test='case4'),
  (select sum(c) from test_mv_a where test='case4'),
  (select sum(c) from test_mv_b where test='case4'),
  (select sum(c) from test_mv_c where test='case4');
