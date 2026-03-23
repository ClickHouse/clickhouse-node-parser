DROP TABLE IF EXISTS test;
CREATE TABLE test (id String, `abc.1` String, `abc.2` String, `abc` String) ENGINE MergeTree order by id;
