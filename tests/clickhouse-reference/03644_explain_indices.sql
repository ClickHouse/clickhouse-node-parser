CREATE TABLE test_indexed
(
    id UInt32,
    value String
) ENGINE = MergeTree()
ORDER BY id SETTINGS add_minmax_index_for_numeric_columns=0, index_granularity=8192;
INSERT INTO test_indexed VALUES (1,'a'),(5,'b'),(10,'c'),(15,'d'),(20,'e');
