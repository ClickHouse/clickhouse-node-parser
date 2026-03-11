SELECT sum(val), count(val) FROM tab1 FULL OUTER JOIN tab2 ON b1 - 2 = a2 OR a1 = b2 SETTINGS join_use_nulls = 0;
SELECT sum(val), count(val) FROM tab1 FULL OUTER JOIN tab2 ON b1 - 2 = a2 OR a1 = b2 SETTINGS join_use_nulls = 1;
