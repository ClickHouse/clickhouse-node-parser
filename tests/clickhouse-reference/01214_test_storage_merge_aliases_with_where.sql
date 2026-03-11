-- { echo  }
SELECT * FROM tt_m order by a;
SELECT * FROM tt_m WHERE b != 0 order by b, a;
SELECT * FROM tt_m WHERE b != 1 order by b, a;
SELECT * FROM tt_m WHERE b != a * 2 order by b, a;
SELECT * FROM tt_m WHERE b / 2 != a order by b, a;
SELECT b FROM tt_m WHERE b >= 0 order by b, a;
SELECT b FROM tt_m WHERE b == 12;
SELECT b FROM tt_m ORDER BY b, a;
SELECT b, count() FROM tt_m GROUP BY b order by b;
SELECT b FROM tt_m order by b LIMIT 1 BY b;
SELECT a FROM tt_m WHERE b = 12;
SELECT max(a) FROM tt_m group by b order by b;
SELECT a FROM tt_m order by b, a;
