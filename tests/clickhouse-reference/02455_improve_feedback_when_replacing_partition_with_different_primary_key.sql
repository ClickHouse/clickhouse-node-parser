CREATE TABLE test_a (id UInt32, company UInt32, total UInt64) ENGINE=SummingMergeTree() PARTITION BY company PRIMARY KEY (id) ORDER BY (id, company);
CREATE TABLE test_b (id UInt32, company UInt32, total UInt64) ENGINE=SummingMergeTree() PARTITION BY company ORDER BY (id, company);
