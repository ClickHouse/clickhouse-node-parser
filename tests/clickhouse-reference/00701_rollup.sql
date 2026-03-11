SELECT a, b, sum(s), count() from rollup GROUP BY ROLLUP(a, b) ORDER BY a, b;
SELECT a, b, sum(s), count() from rollup GROUP BY ROLLUP(a, b) WITH TOTALS ORDER BY a, b;
SELECT a, sum(s), count() from rollup GROUP BY ROLLUP(a) ORDER BY a;
SELECT a, sum(s), count() from rollup GROUP BY a WITH ROLLUP ORDER BY a;
SELECT a, sum(s), count() from rollup GROUP BY a WITH ROLLUP WITH TOTALS ORDER BY a;
SELECT a, b, sum(s), count() from rollup GROUP BY a, b WITH ROLLUP ORDER BY a, b;
