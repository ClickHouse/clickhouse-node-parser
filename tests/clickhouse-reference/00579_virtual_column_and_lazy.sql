set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE sample_00579_1 (x UInt64, d Date DEFAULT today()) ENGINE = MergeTree(d, intHash64(x), intHash64(x), 10);
CREATE TABLE sample_00579_2 (x UInt64, d Date DEFAULT today()) ENGINE = MergeTree(d, intHash64(x), intHash64(x), 10);
CREATE TABLE sample_merge_00579 AS sample_00579_1 ENGINE = Merge(currentDatabase(), '^sample_00579_\\d$');
SET max_threads = 1;
SELECT _sample_factor FROM merge(currentDatabase(), '^sample_00579_\\d$');
