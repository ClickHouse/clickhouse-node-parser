-- Tags: zookeeper, no-replicated-database, no-parallel, no-ordinary-database
SET send_logs_level = 'fatal';

SYSTEM DROP  TABLE IF EXISTS rmt;

SYSTEM DROP  TABLE IF EXISTS rmt1;

SYSTEM DROP  TABLE IF EXISTS rmt2;

SYSTEM DROP  TABLE IF EXISTS rmt3;

SET database_replicated_allow_replicated_engine_arguments = 1;

CREATE TABLE rmt
(
    n UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/test_01148/{shard}/{database}/{table}', '{replica}')
ORDER BY n;

CREATE TABLE rmt
(
    n UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('{default_path_test}{uuid}', '{default_name_test}')
ORDER BY n; -- { serverError BAD_ARGUMENTS }

CREATE TABLE rmt
(
    n UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('{default_path_test}test_01148', '{default_name_test}')
ORDER BY n;

SET distributed_ddl_output_mode = 'none';

SYSTEM DROP  DATABASE IF EXISTS test_01148_atomic;

CREATE DATABASE test_01148_atomic
ENGINE = Atomic;

CREATE TABLE test_01148_atomic.rmt2 ON CLUSTER test_shard_localhost
(
    n int,
    PRIMARY KEY(n)
)
ENGINE = ReplicatedMergeTree;

CREATE TABLE test_01148_atomic.rmt3 AS test_01148_atomic.rmt2; -- { serverError BAD_ARGUMENTS }

CREATE TABLE test_01148_atomic.rmt4 ON CLUSTER test_shard_localhost AS test_01148_atomic.rmt2;

SYSTEM DROP  DATABASE IF EXISTS test_01148_ordinary;

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE test_01148_ordinary
ENGINE = Ordinary;

SYSTEM DROP  DATABASE test_01148_ordinary;

SYSTEM DROP  DATABASE test_01148_atomic;

SYSTEM DROP  TABLE rmt;

SYSTEM DROP  TABLE rmt1;

SYSTEM DROP  DATABASE IF EXISTS imdb_01148;

CREATE DATABASE imdb_01148
ENGINE = Replicated('/test/databases/imdb_01148', '{shard}', '{replica}');

CREATE TABLE imdb_01148.movie_directors
(
    director_id UInt64,
    movie_id UInt64
)
ENGINE = ReplicatedMergeTree
ORDER BY (director_id, movie_id)
SETTINGS index_granularity = 8192;

CREATE TABLE imdb_01148.anything AS imdb_01148.movie_directors;

SYSTEM DROP  DATABASE imdb_01148;