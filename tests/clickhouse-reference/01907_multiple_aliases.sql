DROP TABLE IF EXISTS t;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE t (d Date, z UInt32) ENGINE = MergeTree(d, (z), 1);
INSERT INTO t VALUES ('2017-01-01', 1);
DROP TABLE t;
