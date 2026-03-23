-- Tags: no-fasttest, distributed

SET allow_experimental_prql_dialect = 1;
SET allow_experimental_kusto_dialect = 1;
CREATE TABLE shared_test_table (id UInt64)
ENGINE = MergeTree
ORDER BY (id);
CREATE TABLE distributed_test_table
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), shared_test_table);
INSERT INTO shared_test_table VALUES (123), (651), (446), (315), (234), (764);
SELECT id FROM distributed_test_table LIMIT 3;
SET dialect = 'kusto';
SET dialect = 'prql';
SET dialect = 'clickhouse';
