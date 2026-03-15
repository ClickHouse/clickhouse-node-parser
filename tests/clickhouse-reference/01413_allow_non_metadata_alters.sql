CREATE TABLE non_metadata_alters (
  key UInt64,
  value1 String,
  value2 Enum8('Hello' = 1, 'World' = 2),
  value3 UInt16,
  value4 DateTime,
  value5 Date
)
ENGINE = MergeTree()
ORDER BY tuple();
SET allow_non_metadata_alters = 0;
SET materialize_ttl_after_modify = 0;
