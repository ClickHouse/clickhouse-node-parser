SELECT
    t1.pk,
    t2.x.y
FROM
    test1 AS t1
LEFT JOIN test2 AS t2
    ON t1.pk = t2.pk;

SELECT
    t1.pk,
    t2.`x.y`
FROM
    test1 AS t1
LEFT JOIN test2 AS t2
    ON t1.pk = t2.pk;