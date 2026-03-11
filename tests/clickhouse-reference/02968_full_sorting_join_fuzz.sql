SELECT materialize([NULL]), [], 100, count(materialize(NULL)) FROM t1 ALL INNER JOIN t2 ON t1.key = t2.key PREWHERE 10 WHERE t2.key != 0 WITH TOTALS;
