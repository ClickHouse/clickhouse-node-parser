CREATE TABLE offset_without_limit (
    value UInt32
) Engine = MergeTree()
  PRIMARY KEY value
  ORDER BY value;
SELECT value FROM offset_without_limit ORDER BY value OFFSET 5;
