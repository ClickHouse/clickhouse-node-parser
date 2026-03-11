SELECT s FROM t1 as lhs LEFT JOIN (SELECT * FROM t2 WHERE id2 = 2) as rhs ON lhs.id = rhs.id2;
