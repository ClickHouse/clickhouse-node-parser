-- Tags: no-replicated-database
-- no-replicated-database: It messes up the output and this test explicitly checks the replicated database

CREATE TABLE test
(
    str String,
    column_with_codec String CODEC(ZSTD),
    column_with_alias String MATERIALIZED concat(str, 'a' AS a),
)
ENGINE = MergeTree()
ORDER BY tuple();
SELECT str, column_with_alias, valid_column_1, valid_column_2 FROM test;
CREATE TABLE test2
(
    str String,
    column_with_codec String CODEC(ZSTD),
    column_with_alias String MATERIALIZED concat(str, 'a' AS a),
)
ENGINE = ReplicatedMergeTree('/clickhouse/03224_invalid_alter/{database}/{table}', 'r1')
ORDER BY tuple();
SELECT str, column_with_alias, valid_column_1, valid_column_2 FROM test2;
CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier} ON CLUSTER test_shard_localhost ENGINE = Atomic;
CREATE TABLE test3 ON CLUSTER test_shard_localhost
(
    str String,
    column_with_codec String CODEC(ZSTD),
    column_with_alias String MATERIALIZED concat(str, 'a' AS a),
)
ENGINE = ReplicatedMergeTree('/clickhouse/03224_invalid_alter/{database}_atomic/{table}', 'r1')
ORDER BY tuple();
SELECT str, column_with_alias, valid_column_1, valid_column_2 FROM test3;
CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier} ENGINE = Replicated('/clickhouse/03224_invalid_alter/{database}_replicated', 'shard1', 'replica1') FORMAT Null;
CREATE TABLE test4
(
    str String,
    column_with_codec String CODEC(ZSTD),
    column_with_alias String MATERIALIZED concat(str, 'a' AS a),
)
ENGINE = ReplicatedMergeTree()
ORDER BY tuple()
FORMAT Null;
SELECT str, column_with_alias, valid_column_1, valid_column_2 FROM test4;
