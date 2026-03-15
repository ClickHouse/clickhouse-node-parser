CREATE TABLE tab (col FixedString(2)) engine = MergeTree() ORDER BY col;
SELECT col, col LIKE '%a', col ILIKE '%a' FROM tab WHERE col = 'AA';
