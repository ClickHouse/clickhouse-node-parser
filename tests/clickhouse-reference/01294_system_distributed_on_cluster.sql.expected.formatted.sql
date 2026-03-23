-- Tags: distributed, no-parallel
-- just a smoke test
-- quirk for ON CLUSTER does not uses currentDatabase()
SYSTEM drop  database if exists db_01294;

CREATE DATABASE db_01294;

SET distributed_ddl_output_mode = 'throw';

SYSTEM drop  table if exists db_01294.dist_01294;

CREATE TABLE db_01294.dist_01294 AS `system`.one
ENGINE = Distributed(test_shard_localhost, `system`, one);

SYSTEM drop  database db_01294;