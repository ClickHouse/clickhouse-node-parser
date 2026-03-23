-- Tags: distributed
SET prefer_localhost_replica = 1;

SYSTEM DROP  TABLE IF EXISTS tt6;

CREATE TABLE tt6
(
    id UInt32,
    first_column UInt32,
    second_column UInt32,
    third_column UInt32,
    status String
)
ENGINE = Distributed('test_shard_localhost', '', 'tt7', rand());

SYSTEM DROP  TABLE IF EXISTS tt7;

CREATE TABLE tt7 AS tt6
ENGINE = Distributed('test_shard_localhost', '', 'tt6', rand()); -- {serverError INFINITE_LOOP}

SYSTEM DROP  TABLE tt6;