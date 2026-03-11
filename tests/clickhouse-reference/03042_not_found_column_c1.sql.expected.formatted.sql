SELECT
    t3.c1,
    t3.c2,
    t1.c1,
    t1.c0,
    t2.c2,
    t0.c0,
    t1.c2,
    t2.c1,
    t4.c0
FROM
    t3
CROSS JOIN t0
CROSS JOIN t1
CROSS JOIN t2
CROSS JOIN t4;