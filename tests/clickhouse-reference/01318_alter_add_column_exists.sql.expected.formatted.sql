DROP TABLE IF EXISTS add_table;

CREATE TABLE add_table
(
    key UInt64,
    value1 String
)
ENGINE = MergeTree()
ORDER BY key;

SHOW CREATE TABLE add_table;

ALTER TABLE add_table ADD COLUMN value1 UInt64;

ALTER TABLE add_table ADD COLUMN key String, ADD COLUMN value1 UInt64;

ALTER TABLE add_table ADD COLUMN value1 UInt64, ADD COLUMN value2 UInt64;

ALTER TABLE add_table ADD COLUMN value3 UInt64, ADD COLUMN value3 UInt32; --{serverError ILLEGAL_COLUMN}