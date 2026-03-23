SET distributed_ddl_output_mode='none';
CREATE DATABASE shard_0;
CREATE DATABASE shard_1;
CREATE TABLE demo_loan_01568 ON CLUSTER test_cluster_two_shards_different_databases ( `id` Int64 COMMENT 'id', `date_stat` Date COMMENT 'date of stat', `customer_no` String COMMENT 'customer no', `loan_principal` Float64 COMMENT 'loan principal' ) ENGINE=ReplacingMergeTree() ORDER BY id PARTITION BY toYYYYMM(date_stat); -- { serverError NOT_IMPLEMENTED }
SET distributed_ddl_entry_format_version = 2;
SET distributed_ddl_output_mode='throw';
CREATE TABLE shard_0.demo_loan_01568 ON CLUSTER test_cluster_two_shards_different_databases ( `id` Int64 COMMENT 'id', `date_stat` Date COMMENT 'date of stat', `customer_no` String COMMENT 'customer no', `loan_principal` Float64 COMMENT 'loan principal' ) ENGINE=ReplacingMergeTree() ORDER BY id PARTITION BY toYYYYMM(date_stat);
CREATE TABLE shard_1.demo_loan_01568 ON CLUSTER test_cluster_two_shards_different_databases ( `id` Int64 COMMENT 'id', `date_stat` Date COMMENT 'date of stat', `customer_no` String COMMENT 'customer no', `loan_principal` Float64 COMMENT 'loan principal' ) ENGINE=ReplacingMergeTree() ORDER BY id PARTITION BY toYYYYMM(date_stat);
CREATE TABLE demo_loan_01568_dist AS shard_0.demo_loan_01568 ENGINE=Distributed('test_cluster_two_shards_different_databases', '', 'demo_loan_01568', id % 2);
INSERT INTO demo_loan_01568_dist VALUES (1, '2021-04-13', 'qwerty', 3.14159), (2, '2021-04-14', 'asdfgh', 2.71828);
SELECT * FROM demo_loan_01568_dist ORDER BY id;
SELECT * FROM shard_0.demo_loan_01568;
SELECT * FROM shard_1.demo_loan_01568;
