-- Tags: distributed, no-parallel

-- just a smoke test

-- quirk for ON CLUSTER does not uses currentDatabase()
drop database if exists db_01294;
create database db_01294;
set distributed_ddl_output_mode='throw';
drop table if exists db_01294.dist_01294;
create table db_01294.dist_01294 as system.one engine=Distributed(test_shard_localhost, system, one);
drop database db_01294;
