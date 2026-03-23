-- Tags: distributed

-- <Warning> ConnectionPoolWithFailover: Connection failed at try №1 - is not a problem
SET send_logs_level = 'fatal';
SET prefer_localhost_replica = 1;
SET parallel_distributed_insert_select=1;
CREATE TABLE local_01099_a (number UInt64) ENGINE = Log;
CREATE TABLE local_01099_b (number UInt64) ENGINE = Log;
CREATE TABLE distributed_01099_a AS local_01099_a ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_a, rand());
CREATE TABLE distributed_01099_b AS local_01099_b ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_b, rand());
INSERT INTO local_01099_a SELECT number from system.numbers limit 3;
INSERT INTO distributed_01099_b SELECT * from distributed_01099_a;
SELECT * FROM distributed_01099_b;
CREATE TABLE distributed_01099_a AS local_01099_a ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), local_01099_a, rand());
CREATE TABLE distributed_01099_b AS local_01099_b ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), local_01099_b, rand());
SELECT number, count(number) FROM local_01099_b group by number order by number;
CREATE TABLE distributed_01099_a AS local_01099_a ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), local_01099_a, rand());
CREATE TABLE distributed_01099_b AS local_01099_b ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), local_01099_b, rand());
SET prefer_localhost_replica=0; -- to require distributed send for local replica too
SET prefer_localhost_replica=1;
SELECT number, count(number) FROM distributed_01099_b group by number order by number;
CREATE TABLE local_01099_a (number UInt64) ENGINE = MergeTree() ORDER BY number;
CREATE TABLE local_01099_b (number UInt64) ENGINE = MergeTree() ORDER BY number;
CREATE TABLE distributed_01099_a AS local_01099_a ENGINE = Distributed('test_cluster_1_shard_3_replicas_1_unavailable', currentDatabase(), local_01099_a, rand());
CREATE TABLE distributed_01099_b AS local_01099_b ENGINE = Distributed('test_cluster_1_shard_3_replicas_1_unavailable', currentDatabase(), local_01099_b, rand());
SET send_logs_level='fatal';
SET send_logs_level='warning';
SET send_logs_level='error';
INSERT INTO distributed_01099_b SELECT * FROM urlCluster('test_cluster_two_shards', 'http://localhost:8123/?query=select+{1,2,3}+format+TSV', 'TSV', 's String');
SET parallel_distributed_insert_select=2;
--- https://github.com/ClickHouse/ClickHouse/issues/78464
CREATE TABLE local_01099_c (n UInt64) ENGINE = Log;
CREATE TABLE distributed_01099_c AS local_01099_c ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_c, rand());
INSERT INTO TABLE FUNCTION clusterAllReplicas('test_shard_localhost', currentDatabase(), 'distributed_01099_c') (n) SELECT number FROM remote('localhost', numbers(5)) tx;
SELECT * FROM distributed_01099_c;
INSERT INTO distributed_01099_b with 'http://localhost:8123/?query=' || 'select+{1,2,3}+format+TSV' as url SELECT * FROM urlCluster('test_cluster_two_shards', (select url), 'TSV', 's String');
