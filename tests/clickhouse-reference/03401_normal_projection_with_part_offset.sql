SELECT sum(l._part_offset = r._parent_part_offset) FROM test l JOIN mergeTreeProjection(currentDatabase(), test, p) r USING (a) SETTINGS enable_analyzer = 1;
SELECT sum(l._part_offset = r._parent_part_offset) FROM test l JOIN mergeTreeProjection(currentDatabase(), test, p2) r USING (a) SETTINGS enable_analyzer = 1;
-- Projection analysis should work
SELECT _part_offset FROM test WHERE b = 8;
