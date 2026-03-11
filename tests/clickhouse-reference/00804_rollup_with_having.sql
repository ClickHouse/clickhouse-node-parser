SELECT a, b, count(*) as count FROM rollup_having GROUP BY a, b WITH ROLLUP HAVING a IS NOT NULL ORDER BY a, b, count;
SELECT a, b, count(*) as count FROM rollup_having GROUP BY a, b WITH ROLLUP HAVING a IS NOT NULL and b IS NOT NULL ORDER BY a, b, count;
