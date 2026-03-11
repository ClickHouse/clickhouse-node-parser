SELECT replaceRegexpAll(explain, '__table1\.', '') FROM (EXPLAIN actions=1 SELECT count(*) FROM tab WHERE b < 10 and a < 10) WHERE explain LIKE '%Prewhere%'; -- checks a first, then b (statistics used)
SELECT name, column, statistics from system.parts_columns where (database = currentDatabase()) AND (table = 'tab');
SELECT replaceRegexpAll(explain, '__table1\.', '') FROM (EXPLAIN actions=1 SELECT count(*) FROM tab WHERE c < 10 and a < 10) WHERE explain LIKE '%Prewhere%'; -- checks a first, then c (statistics used)
