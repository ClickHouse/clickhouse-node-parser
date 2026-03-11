SELECT *
FROM
    t1
RIGHT JOIN t0
    ON (t0.c0 = t1.c0)
    AND (t0.c1 >= t1.c1)
ORDER BY t0.c0 ASC
SETTINGS join_algorithm = 'hash';

SELECT *
FROM
    t1
RIGHT JOIN t0
    ON (t0.c0 = t1.c0)
    AND (t0.c1 >= t1.c1)
ORDER BY t0.c0 ASC
SETTINGS join_algorithm = 'parallel_hash';

SELECT *
FROM
    t1
RIGHT JOIN t0
    ON (t0.c0 = t1.c0)
    AND (t0.c1 >= t1.c1)
WHERE t0.c0 = 2
SETTINGS
    join_algorithm = 'parallel_hash',
    query_plan_filter_push_down = 1;

SELECT *
FROM
    t1
RIGHT JOIN t0
    ON (t0.c0 = t1.c0)
    AND (t0.c1 >= t1.c1)
WHERE t0.c0 = 2
SETTINGS
    join_algorithm = 'parallel_hash',
    query_plan_filter_push_down = 0;