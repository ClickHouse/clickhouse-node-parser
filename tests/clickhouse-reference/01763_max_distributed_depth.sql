-- Tags: distributed

SET prefer_localhost_replica = 1;
CREATE TABLE tt6
(
	`id` UInt32,
	`first_column` UInt32,
	`second_column` UInt32,
	`third_column` UInt32,
	`status` String

)
ENGINE = Distributed('test_shard_localhost', '', 'tt7', rand());
CREATE TABLE tt7 as tt6 ENGINE = Distributed('test_shard_localhost', '', 'tt6', rand()); -- {serverError INFINITE_LOOP}
