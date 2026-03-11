SELECT '-- t0 count()';

SELECT count()
FROM t0;

SELECT count()
FROM t1;

SELECT count()
FROM
    t0
INNER JOIN t1
    ON t1.EventId = t0.Id;

SELECT count()
FROM
    t1
INNER JOIN t0
    ON t1.EventId = t0.Id;

SELECT count()
FROM
    t0
LEFT JOIN t1
    ON t1.EventId = t0.Id;

SELECT count()
FROM
    t1
LEFT JOIN t0
    ON t1.EventId = t0.Id;

SELECT count()
FROM
    t0
RIGHT JOIN t1
    ON t1.EventId = t0.Id;

SELECT count()
FROM
    t1
RIGHT JOIN t0
    ON t1.EventId = t0.Id;