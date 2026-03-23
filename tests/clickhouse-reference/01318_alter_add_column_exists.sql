DROP TABLE IF EXISTS add_table;
CREATE TABLE add_table
(
    key UInt64,
    value1 String
)
ENGINE = MergeTree()
ORDER BY key;
