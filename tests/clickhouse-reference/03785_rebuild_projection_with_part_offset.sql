CREATE TABLE test
(
    `a` Int32,
    `b` Int32,
    PROJECTION p
    (
        SELECT
            a,
            b,
            _part_offset
        ORDER BY b
    )
)
ENGINE = ReplacingMergeTree
ORDER BY a
SETTINGS index_granularity_bytes = 10485760, index_granularity = 8192, merge_max_block_size = 8192, deduplicate_merge_projection_mode = 'rebuild';
SELECT sum(l._part_offset = r._parent_part_offset) FROM test l JOIN mergeTreeProjection(currentDatabase(), test, p) r USING (a) SETTINGS enable_analyzer = 1;
