SELECT toStartOfMonth(date) as d, i FROM t_read_in_order ORDER BY d, i LIMIT 5;
SELECT toStartOfMonth(date) as d, i FROM t_read_in_order ORDER BY d DESC, -i LIMIT 5;
-- Here FinishSorting is used, because directions don't match.
SELECT toStartOfMonth(date) as d, i FROM t_read_in_order ORDER BY d, -i LIMIT 5;
SELECT date, i FROM t_read_in_order WHERE date = '2020-10-11' ORDER BY i LIMIT 5;
SELECT * FROM t_read_in_order WHERE date = '2020-10-11' ORDER BY i, v LIMIT 5;
SELECT date, i FROM t_read_in_order WHERE date = '2020-10-12' ORDER BY i LIMIT 5;
SELECT date, i FROM t_read_in_order WHERE date = '2020-10-12' ORDER BY i DESC LIMIT 5;
SELECT a, b FROM t_read_in_order WHERE a = 1 ORDER BY b SETTINGS read_in_order_two_level_merge_threshold = 1;
SELECT a, b FROM t_read_in_order WHERE a = 1 ORDER BY b DESC SETTINGS read_in_order_two_level_merge_threshold = 1;
SELECT * from (
  SELECT toStartOfDay(dt) as date, d FROM t_read_in_order ORDER BY date, round(d) LIMIT 50000000000
  -- subquery with limit 50000000 to stabilize a test result and prevent order by d pushdown
) order by d limit 5;
SELECT * from (
  SELECT toStartOfDay(dt) as date, d FROM t_read_in_order WHERE date = '2020-10-10' ORDER BY round(d) LIMIT 50000000000
  -- subquery with limit 50000000 to stabilize a test result and prevent order by d pushdown
) order by d limit 5;
