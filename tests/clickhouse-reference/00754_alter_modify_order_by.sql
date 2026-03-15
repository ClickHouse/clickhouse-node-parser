SET send_logs_level = 'fatal';
SET optimize_on_insert = 0;
CREATE TABLE no_order(a UInt32, b UInt32) ENGINE = MergeTree ORDER BY tuple();
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE old_style(d Date, x UInt32) ENGINE MergeTree(d, x, 8192);
CREATE TABLE summing(x UInt32, y UInt32, val UInt32) ENGINE SummingMergeTree ORDER BY (x, y);
SELECT * FROM summing;
SELECT * FROM summing FINAL ORDER BY x, y, z;
