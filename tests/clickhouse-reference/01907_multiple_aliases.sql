set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE t (d Date, z UInt32) ENGINE = MergeTree(d, (z), 1);
