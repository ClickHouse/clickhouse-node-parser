DROP TABLE IF EXISTS default_table;
CREATE TABLE default_table (
  key UInt64 DEFAULT 42,
  value1 UInt64 MATERIALIZED key * key,
  value2 ALIAS value1 * key
)
ENGINE = MergeTree()
ORDER BY tuple();
