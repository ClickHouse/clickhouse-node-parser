SELECT d, c, row_number() over (partition by d order by c) as c8 FROM t qualify c8=1 order by d settings max_threads=2, enable_analyzer = 1;
SELECT '---';
SELECT d, c, row_number() over (partition by d order by c) as c8 FROM t order by d, c8 settings max_threads=2;
SELECT * FROM (
SELECT c, min(w) OVER (PARTITION BY s ORDER BY c ASC, s ASC, w ASC)
FROM t limit toUInt64(-1))
WHERE c = -755809149;
