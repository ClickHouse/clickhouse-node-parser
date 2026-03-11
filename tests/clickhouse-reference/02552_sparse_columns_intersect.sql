SELECT count() FROM (SELECT * FROM t_sparse_intersect EXCEPT SELECT * FROM t_sparse_intersect);
SELECT count() FROM (SELECT * FROM t_sparse_intersect INTERSECT SELECT * FROM t_sparse_intersect);
