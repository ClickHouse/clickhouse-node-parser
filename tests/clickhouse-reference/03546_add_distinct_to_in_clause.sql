SET prefer_localhost_replica = 0;
SET allow_experimental_analyzer = 1;
SET distributed_product_mode = 'allow';
SET prefer_global_in_and_join = 1;
SET max_rows_to_read = 100000000;
SET read_overflow_mode = 'break';
create table local_table_1 (id int) engine = MergeTree order by id;
create table local_table_2 (id int) engine = MergeTree order by id;
create table distributed_table_1 (id int) engine = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table_1);
create table distributed_table_2 (id int) engine = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table_2);
select id from distributed_table_1 where id in (select id from distributed_table_2) settings enable_add_distinct_to_in_subqueries = 1;
-- Query with DISTINCT optimization disabled
select id from distributed_table_1 where id in (select id from distributed_table_2) settings enable_add_distinct_to_in_subqueries = 0;
