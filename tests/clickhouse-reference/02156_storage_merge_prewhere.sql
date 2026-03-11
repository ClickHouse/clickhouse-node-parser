SELECT replaceRegexpAll(explain, '__table1\.|_UInt8', '') FROM (EXPLAIN actions=1 SELECT count() FROM t_02156_merge1 WHERE k = 3 AND notEmpty(v)) WHERE explain LIKE '%Prewhere%' OR explain LIKE '%Filter column%' settings enable_analyzer=1;
SELECT replaceRegexpAll(explain, '__table1\.|_UInt8', '') FROM (EXPLAIN actions=1 SELECT count() FROM t_02156_merge1 WHERE k = 3 AND notEmpty(v)) WHERE explain LIKE '%Prewhere%' OR explain LIKE '%Filter column%' settings enable_analyzer=0;
SELECT count() FROM t_02156_merge1 WHERE k = 3 AND notEmpty(v);
SELECT replaceRegexpAll(explain, '__table1\.|_UInt8', '') FROM (EXPLAIN actions=1 SELECT count() FROM t_02156_merge2 WHERE k = 3 AND notEmpty(v)) WHERE explain LIKE '%Prewhere%' OR explain LIKE '%Filter column%';
SELECT count() FROM t_02156_merge2 WHERE k = 3 AND notEmpty(v);
SELECT replaceRegexpAll(explain, '__table1\.|_UInt8', '') FROM (EXPLAIN actions=1 SELECT count() FROM t_02156_merge3 WHERE k = 3 AND notEmpty(v)) WHERE explain LIKE '%Prewhere%' OR explain LIKE '%Filter column%';
SELECT count() FROM t_02156_merge3 WHERE k = 3 AND notEmpty(v);
