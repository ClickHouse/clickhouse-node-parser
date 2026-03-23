DROP TABLE IF EXISTS summing_merge_tree;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE summing_merge_tree (d Date, a String, x UInt32, y UInt64, z Float64) ENGINE = SummingMergeTree(d, a, 8192);
INSERT INTO summing_merge_tree VALUES ('2000-01-01', 'Hello', 1, 2, 3);
INSERT INTO summing_merge_tree VALUES ('2000-01-01', 'Hello', 4, 5, 6);
INSERT INTO summing_merge_tree VALUES ('2000-01-01', 'Goodbye', 1, 2, 3);
SELECT * FROM summing_merge_tree ORDER BY d, a, x, y, z;
DROP TABLE summing_merge_tree;
CREATE TABLE summing_merge_tree (d Date, a String, x UInt32, y UInt64, z Float64) ENGINE = SummingMergeTree(d, a, 8192, (y, z));
--
DROP TABLE IF EXISTS summing;
CREATE TABLE summing (p Date, k UInt64, s UInt64) ENGINE = SummingMergeTree(p, k, 1);
INSERT INTO summing (k, s) VALUES (0, 1);
INSERT INTO summing (k, s) VALUES (0, 1), (666, 1), (666, 0);
SELECT k, s FROM summing ORDER BY k;
DROP TABLE summing;
