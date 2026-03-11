SELECT count() FROM t_update_prewhere PREWHERE c1 != 0 WHERE c2 % 3 = 0;
SELECT sum(c3) FROM t_update_prewhere PREWHERE c3 % 3 = 0 WHERE c1 != 0;
SELECT sum(c2) FROM t_update_prewhere PREWHERE c1 != 0 WHERE c2 % 5 = 1;
