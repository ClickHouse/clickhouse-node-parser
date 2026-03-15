CREATE TABLE test
(
    a Int32,
    b Int32,
    PROJECTION p (    SELECT
        a,
        b,
        _part_offset
    ORDER BY b ASC)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity_bytes = 10485760, index_granularity = 8192;

SELECT sum(l._part_offset = r._parent_part_offset)
FROM
    test AS l
INNER JOIN mergeTreeProjection(currentDatabase(), test, p) AS r
    USING (a)
SETTINGS enable_analyzer = 1;

SELECT sum(l._part_offset = r._parent_part_offset)
FROM
    test AS l
INNER JOIN mergeTreeProjection(currentDatabase(), test, p2) AS r
    USING (a)
SETTINGS enable_analyzer = 1;