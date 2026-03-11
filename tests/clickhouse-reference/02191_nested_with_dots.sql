SELECT * FROM t_nested_with_dots;
SELECT n.values.id FROM t_nested_with_dots;
SELECT t.t2.t3.t4.t5.s1.s2, t.t2.t3.t4.t5.u1.u2 FROM t_nested_with_dots;
SELECT t.t2.t3.t4.t5.s1.s2, t.t2.s3.s4.s5 FROM t_nested_with_dots;
