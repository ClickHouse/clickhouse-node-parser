SELECT table, part_type FROM system.parts WHERE database = currentDatabase() AND table LIKE 'tab_%' ORDER BY table;
SELECT id, str
FROM tab_compact_full
WHERE hasToken(str, 'foo')
LIMIT 3;
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1
    SELECT id
    FROM tab_compact_full
    WHERE hasToken(str, 'foo')
    LIMIT 3
)
WHERE explain LIKE '%text%' OR explain LIKE '%Granules:%';
SELECT id, str
FROM tab_wide_full
WHERE hasToken(str, 'foo')
LIMIT 3;
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1
    SELECT id
    FROM tab_wide_full
    WHERE hasToken(str, 'foo')
    LIMIT 3
)
WHERE explain LIKE '%text%' OR explain LIKE '%Granules:%';
