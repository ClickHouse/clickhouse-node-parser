-- Tags: no-parallel, zookeeper, no-replicated-database
-- Tag no-replicated-database: distributed_ddl_output_mode is none
SYSTEM DROP  ROW POLICY IF EXISTS 02911_rowpolicy ON default.* ON CLUSTER test_shard_localhost;

SYSTEM DROP  USER IF EXISTS 02911_user ON CLUSTER test_shard_localhost;

CREATE USER `02911_user` ON CLUSTER test_shard_localhost;

CREATE ROW POLICY 02911_rowpolicy ON default.`*` ON CLUSTER test_shard_localhost USING 1 TO 02911_user;

SYSTEM DROP  ROW POLICY 02911_rowpolicy ON default.* ON CLUSTER test_shard_localhost;

SYSTEM DROP  USER 02911_user ON CLUSTER test_shard_localhost;