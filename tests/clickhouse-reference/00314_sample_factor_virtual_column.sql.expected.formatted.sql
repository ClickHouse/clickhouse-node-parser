SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE sample_00314_1
(
    x UInt64,
    d Date DEFAULT today()
)
ENGINE = MergeTree(d, intHash64(x), intHash64(x), 10);

CREATE TABLE sample_00314_2
(
    x UInt64,
    d Date DEFAULT today()
)
ENGINE = MergeTree(d, intHash64(x), intHash64(x), 10);

SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

CREATE TABLE sample_merge_00314 AS sample_00314_1
ENGINE = Merge(currentDatabase(), '^sample_00314_\\d$');

SELECT abs(sum(_sample_factor) - 3000000) / 3000000 < 0.001
FROM sample_merge_00314 SAMPLE 100000;

SELECT abs(sum(_sample_factor) - 3000000) / 3000000 < 0.001
FROM merge(currentDatabase(), '^sample_00314_\\d$') SAMPLE 100000;