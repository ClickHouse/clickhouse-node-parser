set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE summing_merge_tree (d Date, a String, x UInt32, y UInt64, z Float64) ENGINE = SummingMergeTree(d, a, 8192);
SELECT * FROM summing_merge_tree ORDER BY d, a, x, y, z;
CREATE TABLE summing_merge_tree (d Date, a String, x UInt32, y UInt64, z Float64) ENGINE = SummingMergeTree(d, a, 8192, (y, z));
CREATE TABLE summing (p Date, k UInt64, s UInt64) ENGINE = SummingMergeTree(p, k, 1);
SELECT k, s FROM summing ORDER BY k;
