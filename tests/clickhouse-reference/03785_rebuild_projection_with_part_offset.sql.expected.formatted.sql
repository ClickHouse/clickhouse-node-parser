SELECT sum(l._part_offset = r._parent_part_offset)
FROM
    test AS l
INNER JOIN mergeTreeProjection(currentDatabase(), test, p) AS r
    USING (a)
SETTINGS enable_analyzer = 1;