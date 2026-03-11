SELECT sum(ignore(*)) FROM t0 a FULL JOIN t1 b ON a.x = b.x FORMAT Null;
