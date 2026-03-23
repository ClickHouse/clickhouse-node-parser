-- Tags: distributed, no-parallel
-- just a smoke test
-- quirk for ON CLUSTER does not uses currentDatabase()
DROP DATABASE IF EXISTS db_01294;

CREATE DATABASE db_01294;

SET distributed_ddl_output_mode = 'throw';

DROP TABLE IF EXISTS db_01294.dist_01294;

CREATE TABLE db_01294.dist_01294 AS `system`.one
ENGINE = Distributed(test_shard_localhost, `system`, one);

DROP DATABASE db_01294;