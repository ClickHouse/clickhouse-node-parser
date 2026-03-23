SET prefer_localhost_replica=0;
CREATE TABLE tmp_01781 (n LowCardinality(String)) ENGINE=Memory;
CREATE TABLE dist_01781 (n LowCardinality(String)) Engine=Distributed(test_cluster_two_shards, currentDatabase(), tmp_01781, cityHash64(n));
SET distributed_foreground_insert=1;
INSERT INTO dist_01781 VALUES ('1'),('2');
-- different LowCardinality size
INSERT INTO dist_01781 SELECT * FROM numbers(1000);
SET distributed_foreground_insert=0;
