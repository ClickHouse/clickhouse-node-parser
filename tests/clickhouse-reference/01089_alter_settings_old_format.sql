set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE old_format_mt (
  event_date Date,
  key UInt64,
  value1 UInt64,
  value2 String
)
ENGINE = MergeTree(event_date, (key, value1), 8192);
SELECT 1;
