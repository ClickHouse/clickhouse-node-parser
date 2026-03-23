-- Tags: shard
SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id String,
    parent_id String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table;

INSERT INTO test_table;

INSERT INTO test_table;

SELECT '--';

SYSTEM DROP  TABLE test_table;