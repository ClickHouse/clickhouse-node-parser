CREATE TABLE t1
(
    x Int
)
ENGINE = Log;

CREATE TABLE t2
(
    x Int
)
ENGINE = Log;

SET cross_to_inner_join_rewrite = 1;

SELECT count() = 1
FROM
    t1
CROSS JOIN t2
WHERE t1.x > t2.x;

SELECT count() = 2
FROM
    t1
CROSS JOIN t2
WHERE t1.x = t2.x;

SELECT count() = 2
FROM
    t1
CROSS JOIN t2
WHERE t1.x = t2.x;

SELECT count() = 1
FROM
    t1
CROSS JOIN t2
WHERE t1.x > t2.x;

SET cross_to_inner_join_rewrite = 2;