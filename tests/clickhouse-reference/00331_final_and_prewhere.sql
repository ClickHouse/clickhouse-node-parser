set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE replace ( EventDate Date,  Id UInt64,  Data String,  Version UInt32) ENGINE = ReplacingMergeTree(EventDate, Id, 8192, Version);
SELECT * FROM replace ORDER BY Id, Version;
SELECT * FROM replace FINAL ORDER BY Id, Version;
SELECT * FROM replace FINAL WHERE Version = 0 ORDER BY Id, Version;
