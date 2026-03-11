SELECT '---- HASH';

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.key = t2.key
    AND ((t1.key < t2.a
    OR t1.a % 2 = 0))
ORDER BY `ALL` ASC
SETTINGS join_algorithm = 'hash';

SELECT
    t1.*,
    t2.*
FROM
    t1
LEFT JOIN t2
    ON t1.key = t2.key
    AND ((t1.key < t2.a
    OR t1.a % 2 = 0))
ORDER BY `ALL` ASC
SETTINGS join_algorithm = 'parallel_hash';