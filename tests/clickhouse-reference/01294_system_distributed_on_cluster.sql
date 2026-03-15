create database db_01294;
set distributed_ddl_output_mode='throw';
create table db_01294.dist_01294 as system.one engine=Distributed(test_shard_localhost, system, one);
