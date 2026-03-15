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
ENGINE = MergeTree
ORDER BY ()
SETTINGS index_granularity_bytes = 10485760, index_granularity = 8192;
SELECT sum(l._part_offset = r._parent_part_offset) FROM test l JOIN mergeTreeProjection(currentDatabase(), test, p) r USING (a) SETTINGS enable_analyzer = 1;
SELECT sum(l._part_offset = r._parent_part_offset) FROM test l JOIN mergeTreeProjection(currentDatabase(), test, p2) r USING (a) SETTINGS enable_analyzer = 1;
