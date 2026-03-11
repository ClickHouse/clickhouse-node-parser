SELECT tuple(*), 2 a FROM t0 JOIN t1 USING (a);
SELECT tuple(t1.*), 2 a FROM t0 JOIN t1 USING (a);
SELECT tuple(t0.*), 2 a FROM t0 JOIN t1 USING (a);
SELECT tuple(t1.a, t0.a, a), 2 a FROM t0 JOIN t1 USING (a);
SELECT tuple(*) FROM t0 JOIN t1 USING (a1);
SELECT tuple(*), 2 a1 FROM t0 JOIN t1 USING (a1) SETTINGS enable_join_runtime_filters=0;
