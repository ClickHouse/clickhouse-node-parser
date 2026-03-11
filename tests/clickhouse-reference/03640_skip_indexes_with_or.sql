SELECT '-- Simple OR condition'; -- surviving granules: 159
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT id FROM tab WHERE (v1 = 111 OR v2 = 111)
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT id FROM tab WHERE (id >= 5000 AND (v1 = 111 OR v2 = 111))
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT id FROM tab WHERE (_part_offset >= 5000 AND (v1 = 111 OR v2 = 111))
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT id FROM tab WHERE v1 = 111 OR v2 = 111 OR v3 = 90000
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT id FROM tab WHERE (v1 BETWEEN 10 AND 20 AND v2 BETWEEN 10 AND 20) OR (v1 BETWEEN 100 AND 2000 AND v2 BETWEEN 100 AND 2000) OR (v1 > 9000 AND v2 > 9000)
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
-- Test with RPN size of 23 - only 6 granules and 6x64=384 rows should be read
SELECT count(*) FROM tab WHERE  (v1 = 1 AND v2 = 10000) OR (v1 = 129 AND v2 = 9872) OR (v1 = 999 OR v2 = 9002) OR (v1 = 1300 AND v2 = 8701) OR (v1 = 5000 AND v2 = 5001) OR (v1 = 9000 AND v2 = 1001) SETTINGS max_rows_to_read=384;
-- 1
SELECT explain AS explain FROM (
    EXPLAIN indexes = 1 SELECT x, y, v1, v2 FROM tab WHERE (x < 100 AND y < 20) AND (v1 = 111 OR v2 = 111)
) WHERE explain LIKE '%Granules%' OR explain LIKE '%PrimaryKey%' OR explain LIKE '%Name%';
