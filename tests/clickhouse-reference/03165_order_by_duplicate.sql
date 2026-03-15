CREATE TABLE test
ENGINE = ReplacingMergeTree
PRIMARY KEY id
AS SELECT number AS id FROM numbers(100);
