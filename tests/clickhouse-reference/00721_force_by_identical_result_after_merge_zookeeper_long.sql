SELECT x, t1.y - t2.y FROM byte_identical_r1 t1 SEMI LEFT JOIN byte_identical_r2 t2 USING x ORDER BY x;
