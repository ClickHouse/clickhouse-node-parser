-- Order after group by in order is determined

SELECT a, b FROM pk_order GROUP BY a, b ORDER BY a, b;
SELECT a FROM pk_order GROUP BY a ORDER BY a;
SELECT a, b, sum(c), avg(d) FROM pk_order GROUP BY a, b ORDER BY a, b;
SELECT a, sum(c), avg(d) FROM pk_order GROUP BY a ORDER BY a;
SELECT -a, sum(c), avg(d) FROM pk_order GROUP BY -a ORDER BY -a;
SELECT d, max(b) FROM pk_order GROUP BY d, a ORDER BY d, a LIMIT 5;
SELECT toString(d), avg(a) FROM pk_order GROUP BY toString(d) ORDER BY toString(d) LIMIT 5;
SELECT toStartOfHour(d) as d1, min(a), max(b) FROM pk_order GROUP BY d1 ORDER BY d1 LIMIT 5;
