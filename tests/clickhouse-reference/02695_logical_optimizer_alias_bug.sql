create table test_local (id UInt32, path LowCardinality(String)) engine = MergeTree order by id;
