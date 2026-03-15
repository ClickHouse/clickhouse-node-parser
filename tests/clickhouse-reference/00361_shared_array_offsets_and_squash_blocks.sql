set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE nested1 (d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, b String)) ENGINE = MergeTree(d, x, 1);
SET max_block_size = 1;
SELECT * FROM nested1 ORDER BY x;
CREATE TABLE nested2 (d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, b String)) ENGINE = MergeTree(d, x, 1);
SELECT * FROM nested2 ORDER BY x;
