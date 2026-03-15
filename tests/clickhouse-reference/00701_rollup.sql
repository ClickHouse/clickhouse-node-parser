CREATE TABLE rollup(a String, b Int32, s Int32) ENGINE = Memory;
SELECT a, b, sum(s), count() from rollup GROUP BY ROLLUP(a, b) ORDER BY a, b;
SELECT a, b, sum(s), count() from rollup GROUP BY ROLLUP(a, b) WITH TOTALS ORDER BY a, b;
SELECT a, sum(s), count() from rollup GROUP BY ROLLUP(a) ORDER BY a;
SELECT a, sum(s), count() from rollup GROUP BY a WITH ROLLUP ORDER BY a;
SELECT a, sum(s), count() from rollup GROUP BY a WITH ROLLUP WITH TOTALS ORDER BY a;
SET group_by_two_level_threshold = 1;
SELECT a, b, sum(s), count() from rollup GROUP BY a, b WITH ROLLUP ORDER BY a, b;
