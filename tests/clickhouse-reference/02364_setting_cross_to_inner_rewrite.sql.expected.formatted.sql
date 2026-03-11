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