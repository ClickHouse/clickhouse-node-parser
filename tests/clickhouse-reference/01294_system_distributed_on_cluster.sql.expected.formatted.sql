CREATE DATABASE db_01294;

SET distributed_ddl_output_mode = 'throw';

CREATE TABLE db_01294.dist_01294 AS `system`.one
ENGINE = Distributed(test_shard_localhost, `system`, one);