select count() as c, x in ('a', 'bb') as g from tab group by g order by c;
SELECT COUNT() FROM test WHERE key <= 100000 AND (NOT (toLowCardinality('') IN (SELECT '')));
