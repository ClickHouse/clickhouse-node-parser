-- Tags: shard

SET enable_analyzer = 1;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id String,
    parent_id String
)
ENGINE = MergeTree ORDER BY id;
INSERT INTO test_table VALUES ('a', '');
INSERT INTO test_table VALUES ('b', 'a');
INSERT INTO test_table VALUES ('c', 'a');
SELECT '--';
DROP TABLE test_table;
