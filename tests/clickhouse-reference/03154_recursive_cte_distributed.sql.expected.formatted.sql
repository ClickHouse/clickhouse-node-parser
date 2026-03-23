-- Tags: shard
SET enable_analyzer = 1;

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